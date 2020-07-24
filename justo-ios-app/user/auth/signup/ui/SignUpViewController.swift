import UIKit

class SignUpViewController: UIViewController, SignUpUI {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameView: ErrorTextFieldView!
    @IBOutlet weak var lastNameView: ErrorTextFieldView!
    @IBOutlet weak var emailView: ErrorTextFieldView!
    @IBOutlet weak var zipCodeView: ErrorTextFieldView!
    @IBOutlet weak var passwordView: ErrorTextFieldView!
    @IBOutlet weak var passwordImageButton: UIButton!
    @IBOutlet weak var confirmPasswordView: ErrorTextFieldView!
    @IBOutlet weak var confirmPasswordImageButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var termsSwitch: UISwitch!
    @IBOutlet weak var termsButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var textFieldsCollection: [ErrorTextFieldView]! {
        didSet {
            textFields = textFieldsCollection.compactMap { view in view.textField }
        }
    }
    
    var presenter: SignUpPresenter!
    weak var signUpNavigationDelegate: SignUpNavigationDelegate?
    var textFields: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        configureNavBar()
        configureViews()
        configureForm()
        setFormData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setDefaultNavigationOptions(isTabBarHidden: true)
    }
    
    private func configureNavBar() {
        titleLabel.text = .localizeString(for: "Sign Up Text")
        titleLabel.textColor = .killarney
        titleLabel.font = .titleMedium(with: FontSize.largeTitle)
    }

    private func setFormData() {
        nameView.placeholder = "Name Placeholder"
        lastNameView.placeholder = "Lastname Placeholder"
        emailView.placeholder = "Email Placeholder"
        zipCodeView.placeholder = "Zip Code Placeholder"
        passwordView.placeholder = "Password Placeholder"
        confirmPasswordView.placeholder = "Confirm Password Placeholder"
        passwordImageButton.tintColor = .black50
        confirmPasswordImageButton.tintColor = .black50
    }

    private func configureViews() {
        activityIndicator.isHidden = true
        termsSwitch.onTintColor = .midnightBlue
        termsButton.setAttributedTitle(createTermsDescription(), for: .normal)
        createAccountButton.roundedStyle(title: "Create Account Text", backgroundColor: .supernova)
    }
    
    private func createTermsDescription() -> NSAttributedString {
        termsButton.tintColor = .black50
        termsButton.titleLabel?.font = .bodyRegular(with: .caption1)
        return String.localizeString(for: "Terms Text").withAttributedRange(of: .localizeString(for: "Terms and Conditions Title Cell"),
                                                                            font: .bodyBold(with: .caption1),
                                                                            color: .black50)
    }
    
    @IBAction func toggleSecureEntry(_ sender: UIButton) {
        sender.tag == SelectedButtonTag.password.rawValue
            ? passwordView.textField.toggleSecureEntry(with: passwordImageButton)
            : confirmPasswordView.textField.toggleSecureEntry(with: confirmPasswordImageButton)
    }
    
    @IBAction func termsAction(_ sender: Any) {
        self.navigationController?.pushViewController(UserInjector().provideTermsAndConditionsViewController(), animated: true)
    }
    
    @IBAction func performSignUp(_ sender: Any) {
        let userRegister = UserRegister(firstName: nameView.value,
                                        lastName: lastNameView.value,
                                        email: emailView.value,
                                        zipCode: zipCodeView.value,
                                        password: passwordView.value,
                                        confirmPassword: confirmPasswordView.value,
                                        acceptTermsAndConditions: termsSwitch.isOn)
        presenter.signUp(userRegister: userRegister)
    }

    func showLoader() {
        activityIndicator.start()
    }

    func hideLoader() {
        activityIndicator.stop()
    }

    func showSignUpSuccess(authToken: User) {
        guard let navigationDelegate = signUpNavigationDelegate else { self.navigationController?.popToRootViewController(animated: false); return }
        navigationDelegate.dismissModalSignUp()
    }

    func showSignUpError(_ errorType: Error) {
        switch errorType {
        case SignUpError.firstname(let error):
            nameView.shouldShowError(isHidden: false, errorMessage: error)
        case SignUpError.lastname(let error):
            lastNameView.shouldShowError(isHidden: false, errorMessage: error)
        case SignUpError.email(let error):
            emailView.shouldShowError(isHidden: false, errorMessage: error)
        case SignUpError.zipcode(let error):
            zipCodeView.shouldShowError(isHidden: false, errorMessage: error)
        case SignUpError.password(let error):
            passwordView.shouldShowError(isHidden: false, errorMessage: error)
        case SignUpError.confirmpassword(let error):
            confirmPasswordView.shouldShowError(isHidden: false, errorMessage: error)
        case SignUpError.terms(let error):
            showErrorAlert(errorMessage: error)
        case SignUpError.graphQL(let error):
            showErrorAlert(errorMessage: error)
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
    
    func resetForm() {
        textFieldsCollection.forEach { view in view.shouldShowError(isHidden: true) }
    }
    
}

protocol SignUpNavigationDelegate: UI {
    func dismissModalSignUp()
}
