import UIKit

class CardViewCell: UITableViewCell {
    
    @IBOutlet weak var cellContentView: UIView!
    @IBOutlet weak var title: UILabel!
    
    static let reuseIdentifier: String = String(describing: self)
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellContentView.cardViewStyle()
        title.setStyle(with: .bodyRegular())
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        selected
            ? cellContentView.roundedStyle(borderWidth: ShoppingConstants.defaultCellBorderWidth, borderColor: .darkBlueGreen, backgroundColor: .darkBlueGreen10)
            : cellContentView.cardViewStyle()
    }
    
    func bind(card: SavedCard) {
        title.text = createCardDescription(card: card)
    }
    
    private func createCardDescription(card: SavedCard) -> String {
        return card.brand.isEmpty
            ? (String.localizeString(for: "Card Template", argument: card.lastDigits))
            : (String.localizedStringWithFormat("%@ que termina en %@", card.brand, card.lastDigits))
    }
}
