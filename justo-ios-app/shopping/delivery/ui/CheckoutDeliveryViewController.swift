import UIKit

class CheckoutDeliveryViewController: UIViewController, CheckoutDeliveryUI, DeliveryDayCollectionDelegate, DeliveryHourDelegate {
    
    @IBOutlet weak var freeDeliveryView: FreeDeliveryView!
    @IBOutlet weak var shippingLabel: UILabel!
    @IBOutlet weak var shippingCostLabel: UILabel!
    @IBOutlet weak var selectDayLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var deliveryDaysCollection: UICollectionView!
    @IBOutlet weak var selectHourLabel: UILabel!
    @IBOutlet weak var deliveryHoursCollection: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var presenter: CheckoutDeliveryPresenter!
    var shippingMethodId: String?
    var shippingMethodPrice: Double?
    var postalCode: String?
    weak var checkoutDeliveryDelegate: CheckoutDeliveryDelegate?
    
    var deliveryDayDataSource: DeliveryDayCollectionDataSource!
    var deliveryHourDataSource: DeliveryHourCollectionDataSource!
    
    var selectedHour: DeliveryHour? {
        didSet {
            nextButton.enabled()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        setCollectionViews()
        shouldFreeDeliveryViewAppear()
        getDeliveryDates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard selectedHour != nil else { return }
        nextButton.enabled()
    }
    
    private func configureViews() {
        shippingLabel.attributedText = String.localizeString(for: "Delivery Cost").asAttributedText(with: .bodyRegular(with: .footnote), color: .black50)
        shippingCostLabel.setStyle(with: .bodyBold(with: .subhead))
        monthLabel.setStyle(with: .bodyRegular(with: .subhead), color: .darkBlueGreen)
        selectDayLabel.attributedText = String.localizeString(for: "Delivery Day Label").asAttributedText()
        selectHourLabel.attributedText = String.localizeString(for: "Delivery Hour Label").asAttributedText()
        nextButton.roundedStyle(title: "Next Button", backgroundColor: .veryLightPinkTwo)
    }
    
    private func setCollectionViews() {
        deliveryDayDataSource.collectionView = deliveryDaysCollection
        deliveryDayDataSource.delegate = self
        deliveryHourDataSource.collectionView = deliveryHoursCollection
        deliveryHourDataSource.delegate = self
    }
    
    private func shouldFreeDeliveryViewAppear() {
        if let price = shippingMethodPrice {
            if price > .zero {
                shippingCostLabel.text = .localizeString(for: "Cost Template", argument: String(price))
                shippingLabel.show()
                shippingCostLabel.show()
            } else {
                freeDeliveryView.show()
            }
        }
    }
    
    private func getDeliveryDates() {
        if let postalCode = postalCode {
            presenter.getDeliveryDates(with: postalCode)
        }
    }
    
    func showDeliveryDatesSuccess(dates: [DeliveryDay]) {
        deliveryDayDataSource.deliveryDays = dates
    }
    
    func showDeliveryDatesError(message: String) {
        showToast(message: message)
    }
    
    func showLoader() {
        activityIndicator.show()
        nextButton.disabled()
    }
    
    func hideLoader() {
        activityIndicator.hide()
    }
    
    func deliveryDaySelected(deliveryDay: DeliveryDay) {
        monthLabel.text = deliveryDay.month.uppercased()
        deliveryHourDataSource.deliveryHours = deliveryDay.hours
        nextButton.disabled()
    }
    
    func deliveryHourSelected(deliveryHour: DeliveryHour) {
        selectedHour = deliveryHour
    }
    
    @IBAction func didSelectDeliveryDate(_ sender: Any) {
        if let id = shippingMethodId, let date = selectedHour {
            nextButton.disabled()
            presenter.updateShippingMethod(shippingMethodId: id, deliveryDate: date.slot)
        }
    }
    
    func showUpdateShippingMethodSuccess(checkout: Checkout) {
        checkoutDeliveryDelegate?.showPaymentPage()
    }
    
    func showUpdateShippingMethodError(message: String) {
        nextButton.enabled()
        showToast(message: message)
    }
}

protocol CheckoutDeliveryDelegate: AnyObject {
    func showPaymentPage()
}
