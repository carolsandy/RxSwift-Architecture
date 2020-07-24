import Foundation
import UIKit

extension UINavigationBar {

    func setTransparentStyle(largeTitles: Bool, isShadowHidden: Bool) {
        self.setBackgroundImage(ImageConstants.empty, for: .default)
        setDefaultStyle(largeTitles: largeTitles, isShadowHidden: isShadowHidden)
        
    }
    
    func setSolidBackgroundStyle(largeTitles: Bool, isShadowHidden: Bool) {
        self.barTintColor = .white
        setDefaultStyle(largeTitles: largeTitles, isShadowHidden: isShadowHidden)
    }
    
    private func setDefaultStyle(largeTitles: Bool, isShadowHidden: Bool) {
        self.setValue(isShadowHidden, forKey: "hidesShadow")
        self.prefersLargeTitles = largeTitles
        self.tintColor = .killarney
    }
}
