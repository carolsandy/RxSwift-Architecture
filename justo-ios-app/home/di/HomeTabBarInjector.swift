import Foundation

class HomeTabBarInjector {
    
    private func provideHomeTabBarPresenter(homeTabBarUI: HomeTabBarUI) -> HomeTabBarPresenter {
        let homeTabBarPresenter = HomeTabBarPresenter(getUserUseCase: UserInjector().provideGetUserUseCase())
        homeTabBarPresenter.ui = homeTabBarUI
        return homeTabBarPresenter
    }
    
    func provideHomeTabBarController() -> HomeTabBarController {
        let homeTabBarController = HomeTabBarController()
        homeTabBarController.presenter = provideHomeTabBarPresenter(homeTabBarUI: homeTabBarController)
        return homeTabBarController
    }
}
