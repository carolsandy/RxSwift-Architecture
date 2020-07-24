import Foundation
import UIKit

extension UITabBar {

    func setCustomItemsStyle(selectedItemTintColor: UIColor, unselectedItemTintColor: UIColor) {
        self.tintColor = selectedItemTintColor
        self.unselectedItemTintColor = unselectedItemTintColor
    }

}
