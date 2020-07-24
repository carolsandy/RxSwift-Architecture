import Foundation
import UIKit

class EditProfileViewController: UIViewController, EditProfileUI {
    
    @IBOutlet weak var firstNameTextView: ErrorTextFieldView!
    @IBOutlet weak var lastNameTextView: ErrorTextFieldView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var changePasswordButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var presenter: EditUserProfilePresenter!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setDefaultNavigationOptions(isTabBarHidden: true, title: .localizeString(for: "Edit Profile Title"))
        setNavigationItems()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureKeyboardKeys()
        configureTextViews()
        configureViews()
        presenter.getUser()
    }
    
    private func setNavigationItems() {
        setLeftNavigationItem(action: #selector(popNavigationController(_:)), target: self)
    }
    
    private func configureTextViews() {
        firstNameTextView.placeholder = "Name Placeholder"
        lastNameTextView.placeholder = "Lastname Placeholder"
    }
    
    private func configureViews() {
        activityIndicator.hide()
        saveButton.roundedStyle(title: "Save Button Title", backgroundColor: .supernova)
        changePasswordButton.roundedStyle(title: "Change password Button Title", backgroundColor: .veryLightPinkTwo)
    }
    
    @IBAction func updatePassword(_ sender: Any) {
        self.navigationController?.pushViewController(UserInjector().provideEditPasswordViewController(), animated: true)
    }
    
    @IBAction func updateAccount(_ sender: Any) {
        let userUpdate = UserUpdateInput(firstName: firstNameTextView.value, lastName: lastNameTextView.value)
        presenter.updateUser(userUpdate: userUpdate)
    }
    
    @IBAction func popNavigationController(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func showUserInfo(user: User) {
        firstNameTextView.value = user.firstName
        lastNameTextView.value = user.lastName
    }
    
    func goToUpdatedAccount() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func showLoader() {
        activityIndicator.start()
    }
    
    func hideLoader() {
        activityIndicator.stop()
    }
    
    func resetFields() {
        firstNameTextView.shouldShowError(isHidden: true)
        lastNameTextView.shouldShowError(isHidden: true)
    }
    
    func showEditProfileError(_ errorType: Error) {
        switch errorType {
        case EditProfileError.firstName(let error):
            firstNameTextView.shouldShowError(isHidden: false, errorMessage: error)
        case EditProfileError.lastName(let error):
            lastNameTextView.shouldShowError(isHidden: false, errorMessage: error)
        case EditProfileError.graphQL(let error):
            lastNameTextView.shouldShowError(isHidden: false, errorMessage: error)
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
