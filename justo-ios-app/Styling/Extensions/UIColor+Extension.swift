import Foundation
import UIKit

extension UIColor {

    static var killarney: UIColor {
        return self.init(red: 0.18, green: 0.28, blue: 0.22, alpha: 1.0)
    }

    static var supernova: UIColor {
        return self.init(red: 1.00, green: 0.76, blue: 0.01, alpha: 1.0)
    }

    static var midnightBlue: UIColor {
        return self.init(red: 0.00, green: 0.19, blue: 0.44, alpha: 1.0)
    }

    static var brickRed: UIColor {
        return self.init(red: 0.84, green: 0.22, blue: 0.29, alpha: 1.0)
    }

    static var mineShaft: UIColor {
        return self.init(red: 0.25, green: 0.23, blue: 0.23, alpha: 1.0)
    }

    static var gray: UIColor {
        return self.init(red: 0.55, green: 0.55, blue: 0.55, alpha: 1.0)
    }

    static var periwinkleGray: UIColor {
        return self.init(red: 0.96, green: 0.96, blue: 0.98, alpha: 1.0)
    }

    static var veryLightPinkTwo: UIColor {
        return self.init(red: 0.95, green: 0.94, blue: 0.94, alpha: 1.0)
    }

    static var black50: UIColor {
        return self.init(white: 0.0, alpha: 0.5)
    }
    
    static var black85: UIColor {
        return self.init(white: 0.0, alpha: 0.85)
    }

    static var whiteInput: UIColor {
        return self.init(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.0)
    }

    static var charcoalGray30: UIColor {
        return self.init(red: 0.24, green: 0.24, blue: 0.26, alpha: 0.3)
    }

    static var lightBlueGray: UIColor {
        return self.init(red: 0.78, green: 0.78, blue: 0.78, alpha: 1.0)
    }
    
    static var darkBlueGreen: UIColor {
        return self.init(red: 0.0, green: 102.0 / 255.0, blue: 72.0 / 255.0, alpha: 1.0)
    }

    static var lightBlueGreyTwo: UIColor {
        return self.init(red: 202.0 / 255.0, green: 210.0 / 255.0, blue: 215.0 / 255.0, alpha: 1.0)
    }
    
    static var veryLightPinkThree: UIColor {
        return self.init(white: 243.0 / 255.0, alpha: 1.0)
    }
    
    static var brownGrey: UIColor {
        return self.init(white: 151.0 / 255.0, alpha: 1.0)
    }
    
    static var veryLightBlue: UIColor {
        return self.init(red: 231.0 / 255.0, green: 233.0 / 255.0, blue: 237.0 / 255.0, alpha: 1.0)
    }
    
    static var darkForestGreen: UIColor {
        return self.init(red: 0.0 / 255.0, green: 36.0 / 255.0, blue: 6.0 / 255.0, alpha: 1.0)
    }
    
    static var darkBlueGreen10: UIColor {
        return UIColor(red: 0.0, green: 102.0 / 255.0, blue: 72.0 / 255.0, alpha: 0.1)
    }
    
    static var darkBlueGreen20Solid: UIColor {
        return self.init(red: 194.0 / 255, green: 210.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
    }
    
    static var brickRed20Solid: UIColor {
        return self.init(red: 239.0 / 255, green: 213.0 / 255.0, blue: 216.0 / 255.0, alpha: 1.0)
    }
    
    public convenience init?(hex: String) {
        let r, g, b: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xFF0000) >> 16) / 255.0
                    g = CGFloat((hexNumber & 0x00FF00) >> 8) / 255.0
                    b = CGFloat(hexNumber & 0x0000FF) / 255.0
                    
                    self.init(red: r, green: g, blue: b, alpha: 1.0)
                    return
                }
            }
        }
        
        return nil
    }
}
