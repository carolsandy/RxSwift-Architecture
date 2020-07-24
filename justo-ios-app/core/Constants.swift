import Foundation
import UIKit

class Constants {
    static let defaultValue: CGFloat = 0
    static let defaultTextFieldCornerRadius: CGFloat = 5.0
    static let defaultBorderWidth: CGFloat = 1.0
    static let defaultButtonCornerRadius: CGFloat = 8.0
    static let defaultLetterSpacing: CGFloat = 0
    static let buttonLetterSpacing: CGFloat = 1.0
    static let defaultCellCornerRadius: CGFloat = 12.0
    static let defaultCellBorderWidth: CGFloat = 0.5
    static let defaultInsetSize: CGFloat = 20
    static let badgeLabelOriginX: CGFloat = 10
    static let badgeLabelOriginY: CGFloat = -10
    static let badgeLabelWidthHeight: CGFloat = 20
    static let badgeButtonWidth: CGFloat = 18
    static let badgeButtonHeight: CGFloat = 16
    static let badgeLabelBorderWidth: CGFloat = 2
    static let toastBottomSpaceRatio: CGFloat = 0.1
    static let toastBottomSpaceWithTabBar: CGFloat = 122.0
    static let toastLabelHeight: CGFloat = 36.0
    static let fullAlpha: CGFloat = 36.0
    static let toastLabelCornerRadius: CGFloat = 18.0
}


class StringConstants {
    static let empty = ""
    static let whitespace = " "
    static let dash = "-"
    static let missingSomethingViewNib = "MissingSomethingView"
    static let errorTextFieldViewNib = "ErrorTextFieldView"
    static let emailPattern = "[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}" +
                                "\\@" +
                                "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
                                "(" +
                                "\\." +
                                "[a-zA-Z0-9][a-zA-Z0-9\\-]{1,25}" +
                                ")+"
    static let postalCodePattern = "^\\d{5}$"
    static let cvvPattern = "^[0-9]{3,4}$"
    
    static func isValidEmail(text: String) -> Bool {
        return NSPredicate(format:"SELF MATCHES %@", StringConstants.emailPattern).evaluate(with: text)
    }
    
    static func isValidPostalCode(text: String) -> Bool {
        return NSPredicate(format:"SELF MATCHES %@", StringConstants.postalCodePattern).evaluate(with: text)
    }
}

class IntConstants {
    static let one = 1
}

struct DataConstants {
    static let emptyData = Data()
}

struct DoubleConstants {
    static let defaultDouble: Double = 0.0
    static let toastDuration: Double = 1.0
    static let toastDelay: Double = 0.6
    static let weightGr: Double = 1000
}

struct BoolConstants {
    static let defaultValue = false
}

struct Cache {
    static let imageCache = NSCache<NSString, AnyObject>()
}

struct ImageConstants {
    static let empty: UIImage = UIImage()
}
