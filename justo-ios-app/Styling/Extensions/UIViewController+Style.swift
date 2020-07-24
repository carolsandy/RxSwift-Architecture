import Foundation
import UIKit

extension UIViewController {

    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    func setTabBarItem(title: String, image: String, selectedImage: String) {
        self.tabBarItem = UITabBarItem.init(title: title,
                                            image: UIImage(named: image),
                                            selectedImage: UIImage(named: selectedImage))
    }

    func setDefaultNavigationOptions(isTabBarHidden: Bool = false,
                                     title: String = StringConstants.empty,
                                     largeTitles: Bool = false,
                                     isShadowHidden: Bool = true) {
        self.navigationController?.navigationBar.setSolidBackgroundStyle(largeTitles: largeTitles, isShadowHidden: isShadowHidden)
        self.navigationItem.title = title
        self.navigationController?.tabBarController?.tabBar.isHidden = isTabBarHidden
    }
    
    func setTransparentNavigationOptions(isTabBarHidden: Bool = false,
                                     title: String = StringConstants.empty,
                                     largeTitles: Bool = false,
                                     isShadowHidden: Bool = true) {
        self.navigationController?.navigationBar.setTransparentStyle(largeTitles: largeTitles, isShadowHidden: isShadowHidden)
        self.navigationItem.title = title
        self.navigationController?.tabBarController?.tabBar.isHidden = isTabBarHidden
    }

    func showDefaultAlert(title: String, message: String, completion: @escaping (UIAlertAction) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: .localizeString(for: "OK Action"), style: .default, handler: completion))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(title: String, action: String, style: UIAlertController.Style, completion: @escaping (UIAlertAction) -> Void) {
        let alert = UIAlertController(title: .localizeString(for: title), message: nil, preferredStyle: style)
        let alertAction = UIAlertAction(title: .localizeString(for: action), style: .default, handler: completion)
        alertAction.setValue(UIColor.darkBlueGreen, forKey: "titleTextColor")
        alert.addAction(alertAction)
        alert.addAction(UIAlertAction(title: .localizeString(for: "Cancel Button"), style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func updateTabCartBadge(cartItems: Int) {
        guard let tabBar = self.tabBarController?.tabBar else { return }
        if let cartItem = tabBar.items?[ShoppingConstants.cartTabPosition] {
            cartItems == .zero ? (cartItem.badgeValue = nil) : (cartItem.badgeValue = String(cartItems))
        }
    }

    func updateNavCartBadge(image: String, action: Selector, target: Any, badgeValue: Int) {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem().withBadgeStyle(image: image, action: action, target: target, badgeValue: badgeValue)
    }
    
    func setLeftNavigationItem(action: Selector, target: UIViewController) {
        let leftItem = UIBarButtonItem().withImage(image: "backChevron", target: target, action: action)
        self.navigationItem.leftBarButtonItem = leftItem
    }
    
    func setRightNavigationItem(image: String, action: Selector, target: UIViewController) {
        let rightItem = UIBarButtonItem().withImage(image: image, target: target, action: action)
        self.navigationItem.rightBarButtonItem = rightItem
    }

    func showToast(message : String, isSuccessStyle: Bool = false) {
        guard let isTabBarhidden = self.tabBarController?.tabBar.isHidden else { return }
        let spaceToTop = isTabBarhidden
            ? self.view.frame.size.height - self.view.frame.size.height * Constants.toastBottomSpaceRatio
            : self.view.frame.size.height - Constants.toastBottomSpaceWithTabBar
        let toastLabel = UILabel(frame: CGRect(x: .zero, y: spaceToTop, width: self.view.frame.size.width, height: Constants.toastLabelHeight))
        toastLabel.setToastStyle(with: message, isSuccesStyle: isSuccessStyle)
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: DoubleConstants.toastDuration, delay: DoubleConstants.toastDelay, options: .curveEaseOut, animations: {
            toastLabel.alpha = .zero
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    func presentSignInViewController(hasNextController: Bool, signInNavigationDelegate: SignInNavigationDelegate) {
        let signInNavigation = AuthInjector().provideSignInNavigationController(signInNavigationDelegate: signInNavigationDelegate, hasNextController: hasNextController)
        present(signInNavigation, animated: true, completion: nil)
    }
    
    func isTabBarHidden(hidden: Bool) {
        self.navigationController?.tabBarController?.tabBar.isHidden = hidden
    }
}
