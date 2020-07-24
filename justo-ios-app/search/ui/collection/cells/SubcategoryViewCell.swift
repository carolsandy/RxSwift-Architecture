import UIKit

class SubcategoryViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cellContentView: UIView!
    
    static let reuseIdentifier: String = String(describing: self)
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override var isSelected: Bool {
        willSet(selected) {
            selected
                ? updateCellState(primaryColor: .white, backgroundColor: .darkBlueGreen)
                : updateCellState(primaryColor: .black50, backgroundColor: .white)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.roundedStyle(cornerRadius: SearchConstants.defaultSegmentCornerRadius, borderWidth: SearchConstants.borderRadiusForCategoryChip, borderColor: .veryLightPinkThree)
        configureViews()
    }
    
    private func configureViews() {
        cellContentView.backgroundColor = .white
        nameLabel.font = .bodySemibold(with: .subhead)
        nameLabel.textColor = .black50
    }
    
    func bindCell(with subcategory: Category) {
        nameLabel.text = subcategory.name
    }
    
    private func updateCellState(primaryColor: UIColor, backgroundColor: UIColor) {
        nameLabel.textColor = primaryColor
        cellContentView.backgroundColor = backgroundColor
    }
    
}
