import Foundation
import UIKit

extension UIView {

    func show() {
        self.isHidden = false
    }

    func hide() {
        self.isHidden = true
    }
    
    func cardViewStyle() {
        self.layer.cornerRadius = Constants.defaultCellCornerRadius
        self.clipsToBounds = true
        self.layer.borderWidth = Constants.defaultCellBorderWidth
        self.layer.borderColor = UIColor.lightBlueGreyTwo.cgColor
        self.layer.backgroundColor = UIColor.white.cgColor
    }
    
    func roundedStyle(cornerRadius: CGFloat = Constants.defaultCellCornerRadius,
                      borderWidth: CGFloat = Constants.defaultValue,
                      borderColor: UIColor = .white,
                      backgroundColor: UIColor = .white) {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.backgroundColor = backgroundColor.cgColor
    }
}
