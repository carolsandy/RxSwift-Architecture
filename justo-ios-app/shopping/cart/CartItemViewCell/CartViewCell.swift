import Foundation
import UIKit

class CartViewCell: UITableViewCell {
    
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemSelectorView: ItemSelectorView!
    
    weak var updateProductItemDelegate: UpdateProductItemDelegate!
    var checkoutLine: CheckoutLine! {
        didSet {
            configureCell()
            configureLine()
        }
    }
    
    static let reuseIdentifier: String = String(describing: self)
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
     override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    func configureCell() {
        itemImageView.contentMode = .scaleAspectFit
        itemImageView.clipsToBounds = true
        productLabel.setStyle(with: .bodyMedium(with: .footnote), color: .black50)
        priceLabel.setStyle(with: .bodySemibold(with: .subhead), color: .black50)
    }
    
    func configureLine() {
        productLabel.text = checkoutLine.checkoutVariant.productName
        priceLabel.text = String.localizeString(for: "Cost Template", argument: String(checkoutLine.totalPrice))
        itemImageView.load(with: checkoutLine.checkoutVariant.productImageUrl)
        setupItemSelectorView()
    }
    
    private func setupItemSelectorView() {
        itemSelectorView.variant = checkoutLine.checkoutVariant.name
        itemSelectorView.weight = checkoutLine.checkoutVariant.weight
        itemSelectorView.quantity = checkoutLine.quantity
        itemSelectorView.updateCellItemDelegate = self
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        itemImageView.image = nil
    }
}

extension CartViewCell: ItemUpdateDelegate {
    
    func updateCellItem(quantity: Int) {
        guard let line = checkoutLine else { return }
        updateProductItemDelegate.updateLine(variantId: line.checkoutVariant.id, quantity: quantity)
    }
}
