import UIKit

class ProductViewCell: UICollectionViewCell, ItemUpdateDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var itemSelectorView: ItemSelectorView!
    
    weak var updateProductItemDelegate: UpdateProductItemDelegate?
    var product: Product! {
        didSet {
            bindProduct()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureViews()
    }
    
    func configureViews() {
        self.cardViewStyle()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        descriptionLabel.setStyle(with: .bodyMedium(with: .subhead), color: .black85)
        priceLabel.setStyle(with: .bodyMedium(with: .footnote), color: .black50)
    }
    
    func bindProduct() {
        imageView.load(with: product.thumbnail)
        descriptionLabel.text = product.name
        if product.variant.count > IntConstants.one { priceLabel.text = "\(product.price)/\(VariantType.kg.localizedString())" } else { priceLabel.text = product.price }
        setupItemSelectorView()
    }
    
    private func setupItemSelectorView() {
        itemSelectorView.quantity = product.availability
        itemSelectorView.updateCellItemDelegate = self
    }
    
    private func getProductVariants() -> [ProductVariant]? {
        return product.variant.filter { variant in variant.name != VariantType.weight.localizedString() }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    func updateCellItem(quantity: Int) {
        guard let variant = getProductVariants()?.first else { return }
        product.availability = quantity
        updateProductItemDelegate?.updateLine(variantId: variant.id, quantity: quantity)
    }
}

protocol UpdateProductItemDelegate: AnyObject {
    func updateLine(variantId: String, quantity: Int)
}
