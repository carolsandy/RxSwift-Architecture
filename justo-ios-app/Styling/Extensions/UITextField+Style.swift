import Foundation
import UIKit

extension UITextField {

    func withPlaceholder(text: String) {
        self.attributedPlaceholder = String.localizeString(for: text).asAttributedText(with: .bodyRegular(), color: .charcoalGray30)
        self.backgroundColor = .whiteInput
        self.layer.borderWidth = Constants.defaultBorderWidth
        self.layer.cornerRadius = Constants.defaultTextFieldCornerRadius
        self.layer.borderColor = UIColor.lightBlueGray.cgColor
    }

    func toggleSecureEntry(with button: UIButton) {
        self.isSecureTextEntry.toggle()

        let iconName = self.isSecureTextEntry ? "eyeOff" : "eyeOn"
        button.setImage(UIImage(named: iconName), for: .normal)
    }

}
