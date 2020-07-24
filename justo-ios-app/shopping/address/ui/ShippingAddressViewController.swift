import UIKit

class ShippingAddressViewController: UIViewController, CheckoutAddressFormUI {
    
    @IBOutlet var formViews: [ErrorTextFieldView]!
    @IBOutlet weak var addressNameView: ErrorTextFieldView!
    @IBOutlet weak var addressNameWarningLabel: UILabel!
    @IBOutlet weak var firstNameView: ErrorTextFieldView!
    @IBOutlet weak var lastNameView: ErrorTextFieldView!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var streetView: ErrorTextFieldView!
    @IBOutlet weak var intNumberView: ErrorTextFieldView!
    @IBOutlet weak var neighborhoodView: ErrorTextFieldView!
    @IBOutlet weak var postalCodeView: ErrorTextFieldView!
    @IBOutlet weak var alcaldiaView: ErrorTextFieldView!
    @IBOutlet weak var cityView: ErrorTextFieldView!
    @IBOutlet weak var phoneNumberView: ErrorTextFieldView!
    @IBOutlet weak var phoneWarningLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    let progress = Progress(totalUnitCount: ShoppingConstants.totalProgressBar)
    
    weak var checkoutAddressFormDelegate: CheckoutAddressFormDelegate?
    var presenter: CheckoutAddressFormPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = .localizeString(for: "Add Shipping Address")
        self.navigationController?.navigationBar.barTintColor = .white
        self.hideKeyboardWhenTappedAround()
        configureNavigationBarItems()
        configureKeyboardKeys()
        setFormData()
    }
    
    private func configureNavigationBarItems() {
        let rightItem = UIBarButtonItem()
            .withCustomStyle(title: "Add Text", font: .bodySemibold(), tintColor: .darkBlueGreen, target: self, action: #selector(addAddress))
        let leftItem = UIBarButtonItem()
            .withCustomStyle(title: "Cancel Button", tintColor: .darkBlueGreen, target: self, action: #selector(dismissShippingAddressViewController))

        self.navigationItem.rightBarButtonItem = rightItem
        self.navigationItem.leftBarButtonItem = leftItem
        self.navigationItem.rightBarButtonItem?.isEnabled = true
        progressView.configure()
    }
    
    private func setFormData() {
        streetLabel.attributedText = String.localizeString(for: "Address Text").asAttributedText(with: .bodyRegular())
        addressNameWarningLabel.attributedText = String.localizeString(for: "Address Name Warning").asAttributedText(with: .bodyRegular(with: .caption1), color: .charcoalGray30)
        phoneWarningLabel.attributedText = String.localizeString(for: "Phone Warning").asAttributedText(with: .bodyRegular(with: .caption1), color: .charcoalGray30)
        addressNameView.placeholder = "Address Name Placeholder"
        firstNameView.placeholder = "Name Placeholder"
        lastNameView.placeholder = "Lastname Placeholder"
        streetView.placeholder = "Street Placeholder"
        intNumberView.placeholder = "Int Number Placeholder"
        neighborhoodView.placeholder = "Neighborhood Placeholder"
        postalCodeView.placeholder = "Postal Code Placeholder"
        alcaldiaView.placeholder = "Alcaldia Placeholder"
        cityView.value = .localizeString(for: "Country Area")
        phoneNumberView.placeholder = "Phone Placeholder"
    }
    
    @objc private func dismissShippingAddressViewController() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @objc private func addAddress() {
        let addressAddInput = AddressAddInput(addressName: addressNameView.value, firstName: firstNameView.value, lastName: lastNameView.value, streetAddress1: streetView.value, streetAddress2: intNumberView.value, city: alcaldiaView.value, cityArea: neighborhoodView.value, postalCode: postalCodeView.value, phone: phoneNumberView.value)
        presenter.addAddress(addressAddInput: addressAddInput)
    }
    
    func showLoader() {
        progressView.start(with: progress)
    }
    
    func hideLoader() {
        progressView.stop(with: progress)
    }
    
    func showAddAddressesSuccess() {
        checkoutAddressFormDelegate?.showAddressCreated()
        dismissShippingAddressViewController()
    }
    
    func showAddAddressError(_ errorType: Error) {
        switch errorType {
        case AddressFormError.addressName(let error):
            addressNameView.shouldShowError(isHidden: false, errorMessage: error)
        case AddressFormError.firstName(let error):
            firstNameView.shouldShowError(isHidden: false, errorMessage: error)
        case AddressFormError.lastName(let error):
            lastNameView.shouldShowError(isHidden: false, errorMessage: error)
        case AddressFormError.streetAddress1(let error):
            streetView.shouldShowError(isHidden: false, errorMessage: error)
        case AddressFormError.cityArea(let error):
            neighborhoodView.shouldShowError(isHidden: false, errorMessage: error)
        case AddressFormError.city(let error):
            alcaldiaView.shouldShowError(isHidden: false, errorMessage: error)
        case AddressFormError.postalCode(let error):
            postalCodeView.shouldShowError(isHidden: false, errorMessage: error)
        case AddressFormError.phone(let error):
            phoneNumberView.shouldShowError(isHidden: false, errorMessage: error)
        case AddressFormError.graphQL(let error):
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
                              completion: { _ in self.progressView.reset(); return })
    }
    
    func resetForm() {
        formViews.forEach { view in view.shouldShowError(isHidden: true) }
    }
    
}

protocol CheckoutAddressFormDelegate: UI {
    
    func showAddressCreated()
}
