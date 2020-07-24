import Foundation
import UIKit

extension UILabel {
    
    func setStyle(with font: UIFont = .bodyRegular(),
                  color: UIColor = .black,
                  spacing: CGFloat = Constants.defaultLetterSpacing) {
        self.font = font
        self.textColor = color
        self.attributedText = NSAttributedString(string: self.text.orDefaultString(), attributes: [NSAttributedString.Key.kern: spacing])
    }
    
    func setBadgeStyle(with badgeValue: Int) {
        self.frame = CGRect(x: Constants.badgeLabelOriginX, y: Constants.badgeLabelOriginY, width: Constants.badgeLabelWidthHeight, height: Constants.badgeLabelWidthHeight)
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = Constants.badgeLabelBorderWidth
        self.layer.cornerRadius = self.bounds.size.height / Constants.badgeLabelBorderWidth
        self.textAlignment = .center
        self.layer.masksToBounds = true
        self.font = .bodyRegular(with: .caption2)
        self.textColor = .white
        self.backgroundColor = .brickRed
        self.text = String(badgeValue)
    }
    
    func setToastStyle(with message: String, isSuccesStyle: Bool) {
        self.backgroundColor = isSuccesStyle ? .darkBlueGreen20Solid : .brickRed20Solid
        self.textColor = isSuccesStyle ? .darkBlueGreen : .brickRed
        self.font = .bodyBold()
        self.textAlignment = .center
        self.text = .localizeString(for: message)
        self.alpha = Constants.fullAlpha
        self.layer.cornerRadius = Constants.toastLabelCornerRadius
        self.clipsToBounds = true
    }
}
