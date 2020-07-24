import UIKit

class ReusableDetailView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    var title: String {
        get { return titleLabel.text ?? StringConstants.empty }
        set { titleLabel.text = .localizeString(for: newValue) }
    }
    
    var detail: String {
        get { return detailLabel.text ?? StringConstants.empty }
        set { detailLabel.text = newValue }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureNib()
    }
    
    private func configureNib() {
        let nib = UINib(nibName: ShoppingConstants.nibForReusableDetailView, bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        contentView.cardViewStyle()
        configureLabels()
    }
    
    private func configureLabels() {
        titleLabel.font = .bodyRegular()
        detailLabel.setStyle(with: .bodyRegular(with: .caption1), color: .black50)
    }
}
