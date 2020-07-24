import UIKit

class CostDetailView: UIView {
    
    @IBOutlet var secondaryLabelCollection: [UILabel]!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var subtotalLabel: UILabel!
    @IBOutlet weak var subtotalCostLabel: UILabel!
    @IBOutlet weak var deliveryLabel: UILabel!
    @IBOutlet weak var deliveryCostLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var discountCostLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalCostLabel: UILabel!
    
    var products: String {
        get { return subtotalLabel.text ?? StringConstants.empty }
        set { subtotalLabel.text = newValue }
    }
    
    var subtotal: String {
        get { return subtotalCostLabel?.text ?? StringConstants.empty }
        set { subtotalCostLabel.text = newValue }
    }
    
    var delivery: String {
        get { return deliveryCostLabel.text ?? StringConstants.empty }
        set { deliveryCostLabel.text = newValue }
    }
    
    var discount: String {
        get { return discountCostLabel.text ?? StringConstants.empty }
        set { discountCostLabel.text = newValue }
    }
    
    var total: String {
        get { return totalCostLabel.text ?? StringConstants.empty }
        set { totalCostLabel.text = newValue }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureNib()
    }
    
    private func configureNib() {
        let nib = UINib(nibName: ShoppingConstants.nibForOrderDetailView, bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        configureLabels()
        setLabelsData()
    }
    
    private func configureLabels() {
        totalLabel.setStyle(with: .bodyRegular(), color: .darkBlueGreen, spacing: ShoppingConstants.letterSpacingForRegularText)
        totalCostLabel.setStyle(with: .bodyRegular(), color: .darkBlueGreen, spacing: ShoppingConstants.letterSpacingForRegularText)
        secondaryLabelCollection.forEach { label in
            label.setStyle(with: .bodyRegular(with: .subhead), color: .black50, spacing: ShoppingConstants.letterSpacingForSubheadText)
        }
    }
    
    private func setLabelsData() {
        deliveryLabel.text = .localizeString(for: "Delivery Cost")
        discountLabel.text = .localizeString(for: "Discount code")
        totalLabel.text = .localizeString(for: "Total".uppercased())
    }
    
    func bind(order: Checkout) {
        products = .localizeString(for: "Products Subtotal %@", argument: String(order.quantity))
        subtotal = .localizeString(for: "Cost Template", argument: String(order.subtotal))
        delivery = .localizeString(for: "Cost Template", argument: order.shippingPrice)
        discount = .localizeString(for: "Cost Template", argument: order.discountAmount)
        total = .localizeString(for: "Cost Template", argument: order.totalPrice)
    }
}
