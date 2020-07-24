import Foundation
import UIKit

struct UserConstants {
    static let noUserCode = 1
    
    static let heightForProfileItem: CGFloat = 44
    
    static let sectionsInProfile: [String] = [.localizeString(for: "My orders Title Cell"), .localizeString(for: "Terms and Conditions Title Cell"), .localizeString(for: "Privacy Notice Title Cell"), .localizeString(for: "Exit Title Cell")]
    static let cellImages: [String] = ["orders", "termsAndConditions", "privacyNotice", "exit"]
    
    static let nibForProfileCell: String = "ProfileViewCell"
    static let identifierForProfileCell: String = "profileViewCell"
    static let profileAccessoryCell: String = "tableAccessoryView"
}
