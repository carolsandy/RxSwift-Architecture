import Foundation
import UIKit

protocol Presenter {
    associatedtype UI
    var ui: UI? { get set }
}

protocol UI: AnyObject {}

protocol LoadingUI: UI {
    
    func showLoader()
    
    func hideLoader()
}

protocol CartEditionUI: UI {
    func updateCartBadge(quantity: Int)
    func showUpdateProductError()
}
