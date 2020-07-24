import Foundation
import UIKit

extension UIButton {

    func roundedStyle(title: String,
                      backgroundColor: UIColor = .white,
                      cornerRadius: CGFloat = Constants.defaultButtonCornerRadius,
                      font: UIFont = UIFont.bodySemibold(),
                      fontColor: UIColor = .black,
                      fontSpacing: CGFloat = Constants.buttonLetterSpacing) {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.backgroundColor = backgroundColor
        self.setAttributedTitle(String.localizeString(for: title)
            .asAttributedText(
                with: font,
                color: fontColor,
                spacing: fontSpacing), for: .normal)
    }
    
    func defaultStyle(title: String, titleColor: UIColor = .black, font: UIFont = UIFont.bodySemibold(), fontSpacing: CGFloat = Constants.buttonLetterSpacing, backgroundColor: UIColor = .white) {
        self.backgroundColor = backgroundColor
        self.setAttributedTitle(String.localizeString(for: title)
            .asAttributedText(
                with: font,
                color: titleColor,
                spacing: fontSpacing), for: .normal)
    }
    
    func setNavigationButtonStyle(image: String, target: Any, action: Selector) {
        self.frame = CGRect(x: Constants.defaultValue, y: Constants.defaultValue, width: Constants.badgeButtonWidth, height: Constants.badgeButtonHeight)
        self.setBackgroundImage(UIImage(named: image), for: .normal)
        self.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func enabled(backgroundColor: UIColor = .supernova) {
        self.isEnabled = true
        self.backgroundColor = backgroundColor
    }
    
    func disabled(backgroundColor: UIColor = .veryLightPinkTwo) {
        self.isEnabled = false
        self.backgroundColor = backgroundColor
    }
}
