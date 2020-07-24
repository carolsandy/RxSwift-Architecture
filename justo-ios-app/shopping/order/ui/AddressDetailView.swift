import UIKit

class AddressDetailView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressOwnerLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var owner: String {
        get { return addressOwnerLabel.text ?? StringConstants.empty }
        set { if !newValue.isEmpty { addressOwnerLabel.text = newValue; addressOwnerLabel.show() } else { addressOwnerLabel.hide() }}
    }
    
    var address: String {
        get { return addressLabel.text ?? StringConstants.empty }
        set { addressLabel.text = newValue }
    }
    
    var phone: String {
        get { return phoneLabel.text ?? StringConstants.empty }
        set { phoneLabel.text = newValue }
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
        let nib = UINib(nibName: ShoppingConstants.nibForAddressDetailView, bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        contentView.cardViewStyle()
        configureLabels()
    }
    
    private func configureLabels() {
        titleLabel.attributedText = String.localizeString(for: "Shipping Address").asAttributedText()
        addressOwnerLabel.setStyle(with: .bodyRegular(with: .caption1), color: .black50)
        addressLabel.setStyle(with: .bodyRegular(with: .caption1), color: .black50)
        phoneLabel.setStyle(with: .bodyRegular(with: .caption1), color: .black50)
    }
    
    func bind(order: Checkout) {
        owner = order.owner
        address = formatAddress(address: order.shippingAddress)
        phone = order.shippingAddress.phone
    }
    
    private func formatAddress(address: Address) -> String {
        let streetAddress = address.streetAddress2.isEmpty ? "\(address.streetAddress1)" : "\(address.streetAddress1), \(address.streetAddress2)"
        return "\(streetAddress), \(address.cityArea) \(address.postalCode), \(address.city).\n\(address.countryArea). \(address.country)"
    }
}
