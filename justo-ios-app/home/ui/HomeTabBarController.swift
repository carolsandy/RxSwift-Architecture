import Foundation
import UIKit

class HomeTabBarController: UITabBarController, UITabBarControllerDelegate, SignInNavigationDelegate, HomeTabBarUI {
    
    var presenter: HomeTabBarPresenter!
    private var isUserAuthenticated: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        self.tabBar.setCustomItemsStyle(selectedItemTintColor: .killarney, unselectedItemTintColor: .black50)
        self.viewControllers = [
            createViewController(controller: HomeInjector().provideHomeViewController(),
                                 title: .localizeString(for: "Home Title Text"),
                                 image: "homeLine",
                                 selectedImage: "homeBold",
                                 tabBarItemTag: .home,
                                 tabBarItemTitle: .localizeString(for: "Home Text")),
            createViewController(controller: CategoriesInjector().provideCategoriesViewController(),
                                 title: .localizeString(for: "Search Text"),
                                 image: "searchLine",
                                 selectedImage: "searchBold",
                                 tabBarItemTag: .search,
                                 tabBarItemTitle: .localizeString(for: "Search Text")),
            createViewController(controller: ShoppingInjector().provideCartViewController(),
                                 title: .localizeString(for: "Cart Text"),
                                 image: "cartLine",
                                 selectedImage: "cartBold",
                                 tabBarItemTag: .cart,
                                 tabBarItemTitle: .localizeString(for: "Cart Text"))]
    }

    private func createViewController(controller: UIViewController,
                                      title: String,
                                      image: String,
                                      selectedImage: String,
                                      tabBarItemTag: TabBarItemTag,
                                      tabBarItemTitle: String = StringConstants.empty) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.view.backgroundColor = .white
        navigationController.setTabBarItem(title: title, image: image, selectedImage: selectedImage)
        navigationController.tabBarItem.tag = tabBarItemTag.rawValue
        navigationController.tabBarItem.title = tabBarItemTitle
        return navigationController
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.tabBarItem.tag == TabBarItemTag.cart.rawValue {
            return shouldProvideSignInController()
        }
        return true
    }
    
    private func shouldProvideSignInController() -> Bool {
        if !isUserAuthenticated {
            let controller = AuthInjector().provideSignInViewController()
            controller.signInNavigationDelegate = self
            let navigation = UINavigationController(rootViewController: controller)
            present(navigation, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == TabBarItemTag.cart.rawValue { presenter.getUser() }
    }
    
    func dismissModalSignIn(hasNextController: Bool) {
        self.selectedIndex = TabBarItemTag.cart.rawValue
    }
    
    func updateUserSignedIn(isUserAuthenticated: Bool) {
        self.isUserAuthenticated = isUserAuthenticated
    }
}

enum TabBarItemTag: Int {
    case home, search, cart
}
