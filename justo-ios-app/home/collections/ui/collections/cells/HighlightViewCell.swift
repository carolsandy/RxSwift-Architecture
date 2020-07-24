
import UIKit

class HighlightViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellBackground: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.roundedStyle()
        configureViews()
    }
    
    func configureViews() {
        cellBackground.backgroundColor = .veryLightPinkThree
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
    }
    
    func bindCell(with item: Collection) {
        cellBackground.backgroundColor = UIColor(hex: item.backgroundColor)
        if !item.backgroundImage.isEmpty { imageView.load(with: item.backgroundImage.asURL() )}
        titleLabel.attributedText = item.name.asAttributedText(with: .bodyBold(with: .headline))
        descriptionLabel.attributedText = item.description.asAttributedText(with: .bodyRegular(with: .footnote), color: .black50)
    }
}
