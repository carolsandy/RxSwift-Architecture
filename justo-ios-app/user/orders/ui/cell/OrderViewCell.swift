import UIKit

class OrderViewCell: UITableViewCell {
    
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var deliveryLabel: UILabel!
    @IBOutlet weak var deliveryValueLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalValueLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusValueLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    
    static let reuseIdentifier: String = String(describing: self)
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: OrdersConstants.insetsForOrderCard)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.contentView.cardViewStyle()
        configureViews()
        setLabels()
    }
    
    private func configureViews() {
        orderLabel.setStyle(with: .bodyRegular(with: .subhead))
        numberLabel.setStyle()
        deliveryLabel.setStyle(with: .bodyRegular(with: .subhead), color: .charcoalGray30)
        totalLabel.setStyle(with: .bodyRegular(with: .subhead), color: .charcoalGray30)
        statusLabel.setStyle(with: .bodyRegular(with: .subhead), color: .charcoalGray30)
        deliveryValueLabel.setStyle(with: .bodyRegular(with: .subhead), color: .black50)
        totalValueLabel.setStyle(with: .bodyRegular(with: .subhead), color: .black50)
        statusValueLabel.setStyle(with: .bodyRegular(with: .subhead), color: .darkBlueGreen)
        addToCartButton.defaultStyle(title: .localizeString(for: "Add to Cart Button"), titleColor: .darkBlueGreen, font: .titleMedium(with: .body), fontSpacing: Constants.defaultLetterSpacing, backgroundColor: .white)
    }
    
    private func setLabels() {
        orderLabel.text = .localizeString(for: "Order Label")
        deliveryLabel.text = .localizeString(for: "Order Delivery")
        totalLabel.text = .localizeString(for: "Order Total")
        statusLabel.text = .localizeString(for: "Order Status")
    }
    
    func bind(with order: Order) {
        numberLabel.text = .localizeString(for: "Order # Template", argument: order.number)
        totalValueLabel.text = .localizeString(for: "Cost Template", argument: order.totalPrice)
        deliveryValueLabel.text = .asFormattedDate(order.date)
        statusValueLabel.text = getOrderState(with: order.state)
    }
    
    func getOrderState(with order: String) -> String {
        if let state = OrderState(rawValue: order.lowercased()) {
            switch state {
            case .ready_to_fulfill:
                return .localizeString(for: "Ready To Fulfill")
            case .unfulfilled:
                return .localizeString(for: "Unfulfilled")
            case .partially_fulfilled:
                return .localizeString(for: "Partially Fulfilled")
            case .fulfilled:
                return .localizeString(for: "Fulfilled")
            case .canceled:
                return .localizeString(for: "Canceled")
            }
        }
        return StringConstants.empty
    }
    
}
