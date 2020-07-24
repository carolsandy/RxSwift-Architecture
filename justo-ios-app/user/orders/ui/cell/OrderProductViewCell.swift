import UIKit

class OrderProductViewCell: UITableViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    static let reuseIdentifier: String = String(describing: self)
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureViews()
    }
    
    private func configureViews() {
        detailLabel.setStyle(with: .bodyMedium(with: .footnote), color: .black50)
        priceLabel.setStyle(with: .bodySemibold(with: .subhead), color: .black50)
    }
    
    func bind(with orderLine: OrderProductLine) {
        productImageView.load(with: orderLine.image)
        detailLabel.text = orderLine.name
        priceLabel.text = .localizeString(for: "Cost Template", argument: orderLine.price)
    }
}
