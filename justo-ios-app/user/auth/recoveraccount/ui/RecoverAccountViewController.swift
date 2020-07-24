import UIKit

class RecoverAccountViewController: UIViewController, UITextFieldDelegate, RecoverAccountUI {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var emailView: ErrorTextFieldView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var presenter: RecoverAccountPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        configureNavBar()
        configureViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setDefaultNavigationOptions(isTabBarHidden: true)
    }

    private func configureNavBar() {
        titleLabel.attributedText = String.localizeString(for: "Recover Account Text")
            .asAttributedText(with: .titleMedium(with: .largeTitle), color: .killarney)
    }

    private func configureViews() {
        activityIndicator.hide()
        emailView.textField.delegate = self
        emailView.placeholder = "Email Placeholder"
        emailView.returnKey = .done
        subtitleLabel.attributedText = String.localizeString(for: "Enter Your Email Text")
            .asAttributedText(with: .bodyMedium(), color: .black50)
        nextButton.roundedStyle(title: "Next Button", backgroundColor: .supernova)
    }

    @IBAction func showRecoverAccountAlert(_ sender: Any) {
        let recoverPassword = RecoverPassword(email: emailView.value)
        presenter.recoverPassword(recoverPassword: recoverPassword)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailView.textField.resignFirstResponder()
        return true
    }

    func showLoader() {
        activityIndicator.start()
    }

    func hideLoader() {
        activityIndicator.stop()
    }

    func showSignInSuccess() {
        self.showDefaultAlert(title: .localizeString(for: "Message Sent Text"),
                              message: .localizeString(for: "Message Sent Instructions Text"),
                              completion: { _ in
                                self.navigationController?.popViewController(animated: true)
        })
    }
    
    func showSignInError(_ errorType: Error) {
        switch errorType {
        case RecoverPasswordError.password(let error):
            emailView.shouldShowError(isHidden: false, errorMessage: error)
        case RecoverPasswordError.graphQL(let error):
            emailView.shouldShowError(isHidden: false, errorMessage: error)
        case RxApolloError.httpException(let error):
            showNetworkErrorAlert(errorMessage: error)
        default:
            print(errorType.localizedDescription)
        }
    }
    
    func showNetworkErrorAlert(errorMessage: String) {
        self.showDefaultAlert(title: .localizeString(for: "Unknown Error Title"),
                              message: .localizeString(for: errorMessage),
                              completion: { _ in return })
    }
    
    func resetFields() {
        emailView.shouldShowError(isHidden: true)
    }
    
}
