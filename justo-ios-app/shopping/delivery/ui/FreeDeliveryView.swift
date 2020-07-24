import UIKit

class FreeDeliveryView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var customContent: UIView!
    @IBOutlet weak var freeDeliveryLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    private func configureViews() {
        let nib = UINib(nibName: ShoppingConstants.nibForFreeDeliveryView, bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        
        customContent.backgroundColor = .darkBlueGreen10
        freeDeliveryLabel.attributedText = String.localizeString(for: "Free Delivery").asAttributedText(with: .bodyRegular(with: .subhead))
    }
    
}
