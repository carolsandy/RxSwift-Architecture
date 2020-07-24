import Foundation
import UIKit

class EditPasswordViewController: UIViewController, EditPasswordUI {
    
    @IBOutlet weak var passwordView: ErrorTextFieldView!
    @IBOutlet weak var confirmPasswordView: ErrorTextFieldView!
    @IBOutlet weak var togglePasswordButton: UIButton!
    @IBOutlet weak var toggleConfirmPasswordButton: UIButton!
    @IBOutlet weak var updatePasswordButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var presenter: EditPasswordPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextViews()
        configureKeyboardKeys()
        configureViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setDefaultNavigationOptions(isTabBarHidden: true, title: .localizeString(for: "Change Password Title"))
        setNavigationItems()
    }
    
    private func setNavigationItems() {
        setLeftNavigationItem(action: #selector(popNavigationController(_:)), target: self)
    }
    
    private func configureTextViews() {
        passwordView.placeholder = "New password Placeholder"
        confirmPasswordView.placeholder = "Repeat password Placeholder"
    }
    
    private func configureViews() {
        activityIndicator.hide()
        updatePasswordButton.roundedStyle(title: .localizeString(for: "Save Password Text"), backgroundColor: .supernova)
        togglePasswordButton.tintColor = .black50
        toggleConfirmPasswordButton.tintColor = .black50
    }
    
    @IBAction func toggleSecureEntry(_ sender: UIButton) {
        if sender.tag == SelectedButtonTag.password.rawValue {
            passwordView.textField.toggleSecureEntry(with: togglePasswordButton)
        } else {
            confirmPasswordView.textField.toggleSecureEntry(with: toggleConfirmPasswordButton)
        }
    }
    
    @IBAction func changePassword(_ sender: UIButton) {
        let passwordUpdateInput = PasswordUpdateInput(newPassword: passwordView.value, newPasswordConfirmation: confirmPasswordView.value)
        presenter.editPassword(passwordUpdateInput: passwordUpdateInput)
    }
    
    @IBAction func popNavigationController(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func passwordUpdatedSuccessfully() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func showLoader() {
        activityIndicator.start()
    }
    
    func hideLoader() {
        activityIndicator.stop()
    }
    
    func resetFields() {
        passwordView.shouldShowError(isHidden: true)
        confirmPasswordView.shouldShowError(isHidden: true)
    }
    
    func showEditPasswordError(_ errorType: Error) {
        switch errorType {
        case EditPasswordError.password(let error):
            passwordView.shouldShowError(isHidden: false, errorMessage: error)
        case EditPasswordError.passwordConfirmation(let error):
            confirmPasswordView.shouldShowError(isHidden: false, errorMessage: error)
        case EditPasswordError.graphQL(let error):
            confirmPasswordView.shouldShowError(isHidden: false, errorMessage: error)
        case RxApolloError.httpException(let error):
            showErrorAlert(errorMessage: error)
        default:
            print(errorType.localizedDescription)
        }
    }
    
    func showErrorAlert(errorMessage: String) {
        self.showDefaultAlert(title: .localizeString(for: "Unknown Error Title"),
                              message: .localizeString(for: errorMessage),
                              completion: { _ in return })
    }
    
}
