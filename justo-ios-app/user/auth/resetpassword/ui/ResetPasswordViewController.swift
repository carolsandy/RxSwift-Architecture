import UIKit

class ResetPasswordViewController: UIViewController, UITextFieldDelegate, ResetPasswordUI {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var savePasswordButton: UIButton!
    @IBOutlet weak var passwordImageButton: UIButton!
    @IBOutlet weak var confirmPasswordImageButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var presenter: ResetPasswordPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        configureNavBar()
        configureViews()
        setTextFieldDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setDefaultNavigationOptions(isTabBarHidden: true)
    }

    private func configureNavBar() {
        titleLabel.attributedText = String.localizeString(for: "Reset Password Text")
            .asAttributedText(with: .titleMedium(with: .largeTitle), color: .killarney)
    }

    private func configureViews() {
        activityIndicator.hide()
        passwordTextField.withPlaceholder(text: "Password Placeholder")
        confirmPasswordTextField.withPlaceholder(text: "Confirm Password Placeholder")
        savePasswordButton.roundedStyle(title: "Save Password Text", backgroundColor: .supernova)
        passwordImageButton.tintColor = .black50
        confirmPasswordImageButton.tintColor = .black50
    }

    private func setTextFieldDelegate() {
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
    }

    @IBAction func toggleSecureEntry(_ sender: UIButton) {
        if sender.tag == SelectedButtonTag.password.rawValue {
            passwordTextField.toggleSecureEntry(with: passwordImageButton)
        } else {
            confirmPasswordTextField.toggleSecureEntry(with: confirmPasswordImageButton)
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField == passwordTextField
            ? confirmPasswordTextField.becomeFirstResponder()
            : textField.resignFirstResponder()
    }

    @IBAction func performSetNewPassword(_ sender: Any) {
        let newPassword = NewPassword(token: "",
                                      uidb64: "",
                                      newPassword: passwordTextField.text.orDefaultString())

        presenter.setNewPassword(setNewPassword: newPassword)
    }

    func showLoader() {
        activityIndicator.start()
    }

    func hideLoader() {
        activityIndicator.stop()
    }

    func showResetPasswordSucces() {
        self.navigationController?.popToRootViewController(animated: true)
    }

    func showResetPasswordError(message: String) {
        print("Error: \(message)")
    }
}
