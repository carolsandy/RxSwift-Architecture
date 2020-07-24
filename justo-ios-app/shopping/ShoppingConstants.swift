import Foundation
import UIKit

class ShoppingConstants {
    
    static let addressButtonSpacingLetter: CGFloat = -0.41
    static let addressButtonCornerRadius: CGFloat = 12
    static let heightForCartItem: CGFloat = 92.0
    static let heightForCheckoutAddressCard: CGFloat = 100
    static let defaultCellBorderWidth: CGFloat = 1.4
    static let widthRatioToCell: CGFloat = 0.34
    static let heightRatioToCell: CGFloat = 0.3
    static let trailingToCell: CGFloat = 25
    
    static let minimunOrderPrice: Double = 250
    
    static let cartSummaryNib = "CartSummaryView"
    static let MXNCurrency = "$"
    
    static let pagerMinPosition = 0
    static let pagerMaxPosition = 1
    static let cartTabPosition = 2
    static let nibForFreeDeliveryView = "FreeDeliveryView"
    static let widthForDeliveryDayCard: CGFloat = 36
    static let radiusForDeliveryDayCard: CGFloat = 18
    static let widthForDeliveryHourCard: CGFloat = 82
    static let radiusForDeliveryHourCard: CGFloat = 5
    static let emptyCart = 0
    static let nibForOrderDetailView = "CostDetailView"
    static let nibForAddressDetailView = "AddressDetailView"
    static let nibForReusableDetailView = "ReusableDetailView"
    static let letterSpacingForRegularText: CGFloat = 0.51
    static let letterSpacingForSubheadText: CGFloat = 0.45
    static let totalProgressBar: Int64 = 10
    static let popTwoControllers = 3
    static let heightForCheckoutCard: CGFloat = 67
}

enum CheckoutPage: Int {
    case address
    case delivery
    case payment
}
