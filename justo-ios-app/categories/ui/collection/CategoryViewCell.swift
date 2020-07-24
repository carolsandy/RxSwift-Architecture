import UIKit

class CategoryViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellBackground: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureViews()
    }
    
    private func configureViews() {
        cellBackground.roundedStyle(cornerRadius: CategoryConstants.cornerRadiusForCategoryCard)
        cellBackground.backgroundColor = .darkBlueGreen
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
    }
    
    func bindCell(with category: Category) {
        nameLabel.attributedText = category.name.asAttributedText(with: .bodyBold(with: .subhead), color: .white)
        imageView.load(with: category.backgroundImage.asURL())
    }
    
}
