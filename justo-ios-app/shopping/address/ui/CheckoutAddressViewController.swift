import UIKit

class CheckoutAddressViewController: UIViewController, CheckoutAddressUI, CheckoutAddressFormDelegate {
    
    @IBOutlet weak var addressesTableView: UITableView!
    @IBOutlet weak var addAddressButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var nextButton: UIButton!
    
    var presenter: CheckoutAddressPresenter!
    weak var checkoutAddressDelegate: CheckoutAddressDelegate?
    
    var addresses: [Address] = [Address]() {
        didSet {
            addressesTableView.reloadData()
            if !addresses.isEmpty { selectDefaultRow() }
        }
    }
    
    var selectedAddress: Address? {
        didSet {
            nextButton.enabled()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        presenter.getAddresses()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !addresses.isEmpty { selectDefaultRow() }
    }
    
    private func configureCollectionView() {
        activityIndicator.hide()
        addressesTableView.delegate = self
        addressesTableView.dataSource = self
        addressesTableView.register(AddressViewCell.nib, forCellReuseIdentifier: AddressViewCell.reuseIdentifier)
        addAddressButton.roundedStyle(title: "Add Shipping Address Button", backgroundColor: .darkBlueGreen10, cornerRadius: ShoppingConstants.addressButtonCornerRadius, font: .bodyRegular(), fontColor: .darkBlueGreen, fontSpacing: ShoppingConstants.addressButtonSpacingLetter)
        nextButton.roundedStyle(title: "Next Button", backgroundColor: .veryLightPinkTwo)
    }
    
    @IBAction func initShippingAddressFormViewController(_ sender: Any) {
        let rootCheckoutController = ShoppingInjector().provideCheckoutAddressFormViewController()
        rootCheckoutController.checkoutAddressFormDelegate = self
        let navigationController = UINavigationController(rootViewController: rootCheckoutController)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func didSelectCheckoutAddress(_ sender: Any) {
        if let addrees = selectedAddress {
            presenter.updateAddress(with: addrees.id)
        }
    }
    
    func showAddressesSuccess(addresses: [Address]) {
        self.addresses = addresses
    }
    
    func showAddressesError(message: String) {
        print(message)
    }
    
    func showLoader() {
        activityIndicator.start()
        nextButton.disabled()
    }
    
    func hideLoader() {
        activityIndicator.stop()
    }
    
    func showAddressCreated() {
        presenter.getAddresses()
    }
    
    func showUpdateAddressSuccess(checkout: Checkout) {
        checkoutAddressDelegate?.showDeliveryPage(shippingMethodId: checkout.shippingMethod.id, shippingMethodPrice: checkout.shippingMethod.price, postalCode: checkout.shippingAddress.postalCode)
    }
    
    func showUpdateAddressError(message: String) {
        showToast(message: message)
        nextButton.enabled()
    }
}
