import Foundation
import UIKit

class ItemSelectorView: UIView {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var equivalenceLabel: UILabel!
    
    weak var updateCellItemDelegate: ItemUpdateDelegate?
    
    var weight: Double = DoubleConstants.defaultDouble 
    var quantity: Int = .zero {
        didSet {
            configureItem()
        }
    }
    
    var variant: String = VariantType.piece.localizedString()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initFromNib()
    }
    
    fileprivate func initFromNib() {
        Bundle.main.loadNibNamed(ItemSelectionConstants.itemSelectorViewNib, owner: self, options: nil)
        containerView.fixInView(self)
        configureLabels()
    }
    
    fileprivate func configureLabels() {
        valueLabel.setStyle(with: .bodyRegular(with: .subhead))
        equivalenceLabel.setStyle(with: .bodyMedium(with: .footnote), color: .darkBlueGreen)
    }
    
    func configureItem() {
        switch quantity {
        case .zero:
            setUpViews(isStarting: true)
        default:
            setUpViews(isStarting: false)
        }
    }
    
    @IBAction func addItem(_ sender: AnyObject) {
        guard quantity != ProductsConstants.maxItemsAmount else { return }
        quantity += 1
        setUpViews(isStarting: false)
        updateLine(quantity: quantity)
    }
    
    @IBAction func removeItem(_ sender: AnyObject) {
        quantity -= 1
        updateLine(quantity: quantity)
        if quantity == 0 {
            setUpViews(isStarting: true)
        } else {
            setUpViews(isStarting: false)
        }
    }
    
    func updateLine(quantity: Int) {
        updateCellItemDelegate?.updateCellItem(quantity: quantity)
    }
    
    private func setUpViews(isStarting: Bool) {
        if variant == VariantType.weight.localizedString() {
            valueLabel.text = weightValue()
            equivalenceLabel.text = equivalenceValue(isWeightValue: true)
        } else {
            valueLabel.text =  pieceValue()
            equivalenceLabel.text = equivalenceValue(isWeightValue: false)
        }
        
        removeButton.isHidden = isStarting
        valueLabel.isHidden = isStarting
    }
    
    private func equivalenceValue(isWeightValue: Bool) -> String {
        if weight != DoubleConstants.defaultDouble {
            if isWeightValue {
                return pieceValue()
            } else {
                return weightValue()
            }
        } else {
            return StringConstants.empty
        }
    }
    
    private func weightValue() -> String {
        return "\(Int(DoubleConstants.weightGr * weight * Double(quantity)))\(VariantType.g.rawValue)"
    }
    
    private func pieceValue() -> String {
        return "\(quantity)\(VariantType.pz.rawValue)"
    }
}

enum ItemSelectionState {
    case start
    case edit
}

protocol ItemUpdateDelegate: AnyObject {
    func updateCellItem(quantity: Int)
}
