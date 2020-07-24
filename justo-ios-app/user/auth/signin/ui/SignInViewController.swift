import UIKit

class SignInViewController: UIViewController, SignInUI, SignUpNavigationDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailView: ErrorTextFieldView!
    @IBOutlet weak var passwordView: ErrorTextFieldView!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var passwordImageButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var presenter: SignInPresenter!
    weak var signInNavigationDelegate: SignInNavigationDelegate?
    var hasNextController: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        configureViews()
        configureKeyboardKeys()
        setDataForm()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setDefaultNavigationOptions(isTabBarHidden: true)
        configureNavigationBarItems()
    }
    
    private func configureViews() {
        activityIndicator.hide()
        titleLabel.attributedText = String.localizeString(for: "Login Text")
            .asAttributedText(with: .titleMedium(with: .largeTitle), color: .killarney)
        forgotPasswordButton.setAttributedTitle(String.localizeString(for: "Forgot Password Text")
            .asAttributedText(with: .bodySemibold(with: .callout), color: .black50), for: .normal)
        signInButton.roundedStyle(title: .localizeString(for: "Sign In Text"), backgroundColor: .supernova)
        orLabel.attributedText = String.localizeString(for: "Or Text")
            .asAttributedText(with: .bodyRegular(), color: .black50)
        signUpButton.roundedStyle(title: .localizeString(for: "Sign Up Text"), backgroundColor: .veryLightPinkTwo)
        passwordImageButton.tintColor = .black50
    }
    
    private func configureNavigationBarItems() {
        guard signInNavigationDelegate != nil else { return }
        let rightItem = UIBarButtonItem()
            .withCustomStyle(title: "Close Modal Button", tintColor: .darkBlueGreen, target: self, action: #selector(dismissSignIn))
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    private func setDataForm() {
        emailView.placeholder = "Email Placeholder"
        passwordView.placeholder = "Password Placeholder"
    }
    
    @IBAction func toggleSecureEntry(sender: UIButton) {
        passwordView.textField.toggleSecureEntry(with: passwordImageButton)
    }
    
    @IBAction func initRecoverAccountViewController(_ sender: Any) {
        self.navigationController?.pushViewController(AuthInjector().provideRecoverAccountViewController(), animated: true)
    }
    
    @IBAction func performSignIn(_ sender: Any) {
        let userCredentials = UserCredentials(email: emailView.value, password: passwordView.value)
        presenter.signIn(userCredentials: userCredentials)
    }
    
    @IBAction func initSignUpViewController(_ sender: Any) {
        guard signInNavigationDelegate != nil else { self.navigationController?.pushViewController(AuthInjector().provideSignUpViewController(), animated: true); return }
        let signUpViewController = AuthInjector().provideSignUpViewController()
        signUpViewController.signUpNavigationDelegate = self
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    @IBAction func dismissSignIn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func showLoader() {
        activityIndicator.start()
    }
    
    func hideLoader() {
        activityIndicator.stop()
    }
    
    func showSignInSuccess(authToken: User) {
        if let navigationDelegate = signInNavigationDelegate {
            dismiss(animated: true, completion: { navigationDelegate.dismissModalSignIn(hasNextController: self.hasNextController) })
        } else {
            self.navigationController?.pushViewController(UserInjector().provideProfileViewController(), animated: true)
        }
    }
    
    func showSignInError(_ errorType: Error) {
        switch errorType {
        case SignInError.email(let error):
            emailView.shouldShowError(isHidden: false, errorMessage: error)
        case SignInError.password(let error):
            passwordView.shouldShowError(isHidden: false, errorMessage: error)
        case SignInError.graphQL(let error):
            passwordView.shouldShowError(isHidden: false, errorMessage: error)
        case RxApolloError.httpException(let error):
            showNetworkErrorAlert(errorMessage: error)
        default:
            print(errorType.localizedDescription)
        }
    }
    
    func resetFields() {
        emailView.shouldShowError(isHidden: true)
        passwordView.shouldShowError(isHidden: true)
    }
    
    func showNetworkErrorAlert(errorMessage: String) {
        self.showDefaultAlert(title: .localizeString(for: "Unknown Error Title"),
                              message: .localizeString(for: errorMessage),
                              completion: { _ in return })
    }
    
    func dismissModalSignUp() {
        guard let navigationDelegate = signInNavigationDelegate else { return }
        dismiss(animated: true, completion: { navigationDelegate.dismissModalSignIn(hasNextController: self.hasNextController) })
    }
    
}

protocol SignInNavigationDelegate: AnyObject {
    func dismissModalSignIn(hasNextController: Bool)
}
