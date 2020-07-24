import UIKit

class DeliveryHourViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellContentView: UIView!
    @IBOutlet weak var dividerView: UIView!
    @IBOutlet weak var startIntervalLabel: UILabel!
    @IBOutlet weak var endIntervalLabel: UILabel!
    
    static let reuseIdentifier: String = String(describing: self)
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override var isSelected: Bool {
        didSet(newValue) {
            setSelected(newValue)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureViews()
    }
    
    private func configureViews() {
        startIntervalLabel.setStyle(with: .bodyRegular(with: .subhead))
        endIntervalLabel.setStyle(with: .bodyRegular(with: .subhead))
        cellContentView.roundedStyle(cornerRadius: ShoppingConstants.radiusForDeliveryHourCard, backgroundColor: .veryLightPinkThree)
    }
    
    private func setSelected(_ selected: Bool) {
        isSelected
            ? updateCellState(primaryColor: .white, backgroundColor: .darkBlueGreen)
            : updateCellState(primaryColor: .black, backgroundColor: .veryLightPinkThree)
    }
    
    private func updateCellState(primaryColor: UIColor, backgroundColor: UIColor) {
        cellContentView.backgroundColor = backgroundColor
        startIntervalLabel.textColor = primaryColor
        endIntervalLabel.textColor = primaryColor
        dividerView.backgroundColor = primaryColor
    }
    
    func bind(deliveryHour: DeliveryHour) {
        startIntervalLabel.text = deliveryHour.startInterval
        endIntervalLabel.text = deliveryHour.endInterval
    }
}
