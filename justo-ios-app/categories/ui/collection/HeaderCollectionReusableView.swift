import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var headerTitle: UILabel!
    
    var title: String? {
        get { return headerTitle.text }
        set { headerTitle.text = newValue }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        headerTitle.font = .bodySemibold()
    }
    
}
