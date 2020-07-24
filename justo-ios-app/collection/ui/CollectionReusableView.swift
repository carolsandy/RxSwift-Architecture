import Foundation
import UIKit

class CollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var headerSubtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bindHeader(withItem item: Collection) {
        headerTitle.attributedText = item.name.asAttributedText(with: .bodyBold(), color: .black85)
        headerSubtitle.attributedText = item.description.asAttributedText(with: .bodyMedium(with: .footnote), color: .black85)
        if !item.backgroundImage.isEmpty { headerImage.load(with: item.backgroundImage.asURL()) }
        self.backgroundColor = UIColor(hex: item.backgroundColor)
    }
}
