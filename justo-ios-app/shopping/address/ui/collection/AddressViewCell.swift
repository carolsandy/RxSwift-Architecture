import UIKit

class AddressViewCell: UITableViewCell {
    
    @IBOutlet weak var cellContentView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    static let reuseIdentifier: String = String(describing: self)

    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureViews()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        selected
            ? cellContentView.roundedStyle(borderWidth: ShoppingConstants.defaultCellBorderWidth, borderColor: .darkBlueGreen, backgroundColor: .darkBlueGreen10)
            : cellContentView.cardViewStyle()
    }
    
    private func configureViews() {
        cellContentView.cardViewStyle()
        nameLabel.setStyle(with: .bodyRegular())
        ownerLabel.setStyle(with: .bodyRegular(with: .caption1), color: .black50)
        addressLabel.setStyle(with: .bodyRegular(with: .caption1), color: .black50)
        phoneLabel.setStyle(with: .bodyRegular(with: .caption1), color: .black50)
    }
    
    func bindData(with item: Address) {
        nameLabel.text = item.addressName
        ownerLabel.text = "\(item.firstName) \(item.lastName)"
        addressLabel.text = buildAddress(with: item)
        phoneLabel.text = item.phone
    }
    
    private func buildAddress(with item: Address) -> String {
        return "\(item.streetAddress1)\((!item.streetAddress2.isEmpty) ? ", \(item.streetAddress2)" : ""), "
        + "\(item.cityArea), \(item.postalCode), \(item.city), \(item.countryArea), \(item.country)"
    }
}
