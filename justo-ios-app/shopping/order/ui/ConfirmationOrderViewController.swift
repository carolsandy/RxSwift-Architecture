import UIKit

class ConfirmationOrderViewController: UIViewController, UITextFieldDelegate, ConfirmationOrderUI, MissingSomethingDelegate {
    
    @IBOutlet weak var costDetailView: CostDetailView!
    @IBOutlet weak var addressDetailView: AddressDetailView!
    @IBOutlet weak var deliveryDateView: ReusableDetailView!
    @IBOutlet weak var paymentDetailView: ReusableDetailView!
    @IBOutlet weak var noteTextView: ErrorTextFieldView!
    @IBOutlet weak var warningNoteLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var confirmationButton: UIButton!
    
    var presenter: ConfirmationOrderPresenter!
    var cardFormatted: String = StringConstants.empty
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDefaultNavigationOptions(isTabBarHidden: true, title: String.localizeString(for: "Confirmation Order"))
        self.hideKeyboardWhenTappedAround()
        setNavigationItems()
        configureViews()
        presenter.fetchCheckout()
    }
    
    private func setNavigationItems() {
        let barButtonItem = UIBarButtonItem().withImage(image: "backChevron", target: self, action: #selector(didSelectLeftBarButtonItem))
        self.navigationItem.leftBarButtonItem = barButtonItem
    }
    
    private func configureViews() {
        noteTextView.placeholder = "Note Placeholder"
        warningNoteLabel.text = .localizeString(for: "Warning Note")
        noteTextView.textField.delegate = self
        noteTextView.returnKey = .done
        warningNoteLabel.setStyle(with: .bodyRegular(with: .caption1), color: .charcoalGray30)
        confirmationButton.roundedStyle(title: "Confirmation Button", backgroundColor: .supernova)
    }
    
    private func setData(order: Checkout) {
        costDetailView.bind(order: order)
        addressDetailView.bind(order: order)
        deliveryDateView.title = "Delivery Date"
        deliveryDateView.detail = DateFormatter.formatDate(with: order.deliveryDate)
        paymentDetailView.title = "Payment Information"
        paymentDetailView.detail = cardFormatted
    }
    
    @objc func didSelectLeftBarButtonItem() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didSelectConfirmOrder(_ sender: Any) {
        presenter.completeCheckout(note: noteTextView.value)
    }
    
    func showErrorAlert(errorMessage: String) {
        self.showDefaultAlert(title: .localizeString(for: "Unknown Error Title"),
                              message: .localizeString(for: errorMessage),
                              completion: { _ in return })
    }
    
    func showLoader() {
        activityIndicator.start()
        confirmationButton.disabled()
        self.navigationItem.leftBarButtonItem?.disabled()
    }
    
    func hideLoader() {
        activityIndicator.stop()
        confirmationButton.enabled()
        self.navigationItem.leftBarButtonItem?.enabled()
    }
    
    func showOrderConfirmationSuccess(with checkout: Checkout) {
        setData(order: checkout)
    }
    
    func showOrderConfirmationError(message: String) {
        showToast(message: message)
    }
    
    func showCompleteCheckoutSuccess(checkoutOrder: CheckoutOrder) {
        let orderStatusViewController = ShoppingInjector().provideOrderStatusViewController(checkoutOrder: checkoutOrder)
        self.navigationController?.pushViewController(orderStatusViewController, animated: true)
    }
    
    func showCompleteCheckoutError(message: String) {
        showErrorAlert(errorMessage: message)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        noteTextView.textField.resignFirstResponder()
        return true
    }
    
    func missingSomethingRetry() {
        presenter.fetchCheckout()
    }
}
