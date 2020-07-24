import UIKit

class VariantsView: UIView {
    
    @IBOutlet weak var pieceButton: UIButton!
    @IBOutlet weak var weightButton: UIButton!
    @IBOutlet weak var minButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var stepperView: UIView!
    @IBOutlet weak var unitsView: UIStackView!
    @IBOutlet weak var unitLabel: UILabel!
    
    private let minVariants: Int = 1
    private var type: String = VariantType.piece.localizedString()
    private var isPieceSelected: Bool = true
    var weight: Double = DoubleConstants.defaultDouble
    var price: String = StringConstants.empty
    var quantity = 1 {
        willSet {
            if isPieceSelected { quantityLabel.text = String(newValue) } else { quantityLabel.text = String(Int(DoubleConstants.weightGr * weight * Double(newValue))) }
        }
    }
    weak var productSelectionDelegate: ProductSelectionDelegate?
    
    var variants: [ProductVariant] = [] {
        didSet { bindData() }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
    }
    
    private func bindData() {
        if self.variants.count > minVariants {
            type = VariantType.weight.localizedString()
            unitsView.isHidden = false
            bindPieceData()
        } else {
            type = VariantType.piece.localizedString()
            unitsView.isHidden = true
            bindPieceData()
        }
    }
    
    private func configureSubviews() {
        let nib = UINib(nibName: ProductsConstants.nibForVariantsView, bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        stepperView.roundedStyle(cornerRadius: ProductsConstants.defaultCornerRadius,
                                 borderWidth: ProductsConstants.defaultBorderWidth,
                                 borderColor: .brownGrey)
        
        minButton.titleLabel?.font = .bodyMedium(with: .title3)
        plusButton.titleLabel?.font = .bodyMedium(with: .title3)
        quantityLabel.font = .bodyRegular()
        unitLabel.font = .bodyRegular()
        priceLabel.font = .bodyMedium(with: .title2)
        
        pieceButton.roundedStyle(title: VariantType.piece.localizedString(),
                                 backgroundColor: .veryLightPinkTwo,
                                 cornerRadius: ProductsConstants.defaultCornerRadius,
                                 font: .bodyRegular(with: .subhead))
        
        weightButton.roundedStyle(title: .localizeString(for: "Weight Button Text"),
                                  cornerRadius: ProductsConstants.defaultCornerRadius,
                                  font: .bodyRegular(with: .subhead))
    }
    
    @IBAction func didSelectPieceButton(_ sender: Any) {
        isPieceSelected = true
        quantityLabel.text = String(quantity)
        bindPieceData()
        pieceButton.backgroundColor = .veryLightPinkTwo
        weightButton.backgroundColor = .white
        productSelectionDelegate?.selectedVariant(variant: VariantType.piece.localizedString())
    }
    
    @IBAction func didSelectWeightButton(_ sender: Any) {
        isPieceSelected = false
        bindWeightData()
        weightButton.backgroundColor = .veryLightPinkTwo
        pieceButton.backgroundColor = .white
        quantityLabel.text = String(Int(DoubleConstants.weightGr * weight * Double(quantity)))
        productSelectionDelegate?.selectedVariant(variant: VariantType.weight.localizedString())
    }
    
    private func bindPieceData() {
        setPriceLabel(VariantType.pz)
    }
    
    private func bindWeightData() {
        setPriceLabel(VariantType.g)
    }
    
    private func setPriceLabel(_ variant: VariantType) {
        if variants.count > minVariants { priceLabel.text = "\(price) / \(VariantType.kg.localizedString())" } else { priceLabel.text = "\(price)" }
        unitLabel.text = variant.rawValue
    }
    
    @IBAction func didSelectMinAction(_ sender: Any) {
        if quantity != .zero {
            quantity -= 1
            productSelectionDelegate?.updateProductItem(quantity: quantity)
        }
    }
    
    @IBAction func didSelectAddAction(_ sender: Any) {
        guard quantity != ProductsConstants.maxItemsAmount else { return }
        quantity += 1
        productSelectionDelegate?.updateProductItem(quantity: quantity)
    }
}

enum VariantType: String {
    case pz
    case kg
    case g
    case piece = "Piece Text"
    case weight = "Weight Text"
    
    func localizedString() -> String {
        return String.localizeString(for: self.rawValue)
    }
}

protocol ProductSelectionDelegate: UI {
    func updateProductItem(quantity: Int)
    func selectedVariant(variant: String)
}
