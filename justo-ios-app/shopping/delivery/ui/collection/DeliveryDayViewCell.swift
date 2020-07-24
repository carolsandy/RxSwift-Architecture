import UIKit

class DeliveryDayViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var numberContainer: UIView!
    @IBOutlet weak var numberLabel: UILabel!
    
    static let reuseIdentifier: String = String(describing: self)
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override var isSelected: Bool {
        didSet {
            numberContainer.backgroundColor = isSelected ? .darkBlueGreen : .veryLightPinkThree
            numberLabel.textColor = isSelected ? .white : .black
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureViews()
    }
    
    func configureViews() {
        dayLabel.font = .bodyRegular(with: .footnote)
        numberLabel.font = .bodyRegular(with: .headline)
        numberContainer.roundedStyle(cornerRadius: ShoppingConstants.radiusForDeliveryDayCard, backgroundColor: .veryLightPinkThree)
    }
    
    func bind(deliveryDay: DeliveryDay) {
        dayLabel.text = String(deliveryDay.weekday.prefix(IntConstants.one))
        numberLabel.text = String(deliveryDay.day)
    }
    
}
