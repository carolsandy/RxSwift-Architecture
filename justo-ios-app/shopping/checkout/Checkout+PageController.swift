import Foundation
import UIKit

extension CheckoutViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.controllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed else { return }
        if let viewController = pageViewController.viewControllers?.first, let currentIndex = controllers.firstIndex(of: viewController) {
            updatePage(with: currentIndex)
        }
    }
    
    func updatePage(with index: Int) {
        if let page = CheckoutPage(rawValue: index) {
            switch page {
            case .address:
                setIconState(title: "Shipping Address", isAddressSelected: true, isDeliverySelected: false, isPaymentSelected: false)
            case .delivery:
                setIconState(title: "Delivery Options", isAddressSelected: true, isDeliverySelected: true, isPaymentSelected: false)
            case .payment:
                setIconState(title: "Payment Method", isAddressSelected: true, isDeliverySelected: true, isPaymentSelected: true)
            }
        }
    }
    
    private func setIconState(title: String, isAddressSelected: Bool, isDeliverySelected: Bool, isPaymentSelected: Bool) {
        self.title = .localizeString(for: title)
        addressButton.isSelected = isAddressSelected
        deliveryButton.isSelected = isDeliverySelected
        paymentButton.isSelected = isPaymentSelected
    }
    
}
