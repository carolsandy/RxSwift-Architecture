import Foundation
import UIKit

class MissingSomethingView: UIView {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    weak var delegate: MissingSomethingDelegate?
    
    var title: String? {
        didSet { titleLabel.text = title }
    }
    
    var subject: String? {
        didSet { subjectLabel.text = subject }
    }
    
    var image: String? {
        didSet { if let imageName = image { imageView.image = UIImage(named: imageName) } }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureNib()
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureNib()
        configureView()
    }
    
    private func configureNib() {
        let nib = UINib(nibName: StringConstants.missingSomethingViewNib, bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        containerView.fixInView(self)
    }
    
    private func configureView() {
        titleLabel.setStyle(with: .bodyBold(), color: .darkBlueGreen)
        subjectLabel.setStyle(with: .bodyMedium(with: .title3), color: .black50)
        scrollView.refreshControl = UIRefreshControl().configureRefreshControl(action:  #selector(refreshView), target: self)
    }
    
    @objc func refreshView() {
        guard let delegate = delegate else { return }
        delegate.missingSomethingRetry()
        scrollView.refreshControl?.endRefreshing()
    }
}

protocol MissingSomethingDelegate: AnyObject {
    func missingSomethingRetry()
}
