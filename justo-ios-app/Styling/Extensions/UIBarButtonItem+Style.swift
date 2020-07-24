import Foundation
import UIKit

extension UIBarButtonItem {

    func withImage(image: String, target: UIViewController, action: Selector?) -> UIBarButtonItem {
        let image = UIImage.init(named: image)
        let barButton = UIBarButtonItem.init(image: image, style: .plain, target: target, action: action)
        barButton.tintColor = .black
        return barButton
    }
    
    func withCustomStyle(title: String,
                         font: UIFont = .bodyRegular(),
                         tintColor: UIColor, target: UIViewController?,
                         action: Selector?) -> UIBarButtonItem {
        let barButton = UIBarButtonItem.init(title: .localizeString(for: title), style: .plain, target: target, action: action)
        barButton.setTitleTextAttributes([NSAttributedString.Key.font: font,
                                          NSAttributedString.Key.foregroundColor: tintColor], for: .normal)
        return barButton
    }

    func withCustomLabel(text: String, tintColor: UIColor = .black) -> UIBarButtonItem {
        let titleLabel = UILabel()
        titleLabel.sizeToFit()
        titleLabel.attributedText = String.localizeString(for: text).asAttributedText(with: .bodySemibold(), color: tintColor)
        return UIBarButtonItem(customView: titleLabel)
    }
    
    func withBadgeStyle(image: String, action: Selector, target: Any, badgeValue: Int) -> UIBarButtonItem {
        let rightButton = UIButton()
        rightButton.setNavigationButtonStyle(image: image, target: target, action: action)
        
        if badgeValue != .zero {
            let label = UILabel()
            label.setBadgeStyle(with: badgeValue)
            rightButton.addSubview(label)
        }
        
        let rightBarButtomItem = UIBarButtonItem(customView: rightButton)
        
        return rightBarButtomItem
    }
    
    func enabled() {
        self.isEnabled = true
    }
    
    func disabled() {
        self.isEnabled = false
    }
    
}
