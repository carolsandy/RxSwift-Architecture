import UIKit

class OnboardingPageCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    static let reuseIdentifier: String = String(describing: self)
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    var page: OnboardingPage? {
        didSet {
            guard let currentPage = page else { return }
            productImageView.image = UIImage.init(named: currentPage.image)
            descriptionLabel.text = currentPage.description
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        descriptionLabel.font = .bodyRegular(with: FontSize.title3)
    }
    
}
