import Foundation
import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidAppear(_ animated: Bool) {
        showNextViewController()
    }
    
    private func showNextViewController() {
        UserDefaults.standard.bool(forKey: OnboardingConstants.hasVisitedOnboarding) ?  showHomeViewController(): showOnboardingViewController()
    }
    
    private func showHomeViewController() {
        self.navigationController?.pushViewController(HomeTabBarInjector().provideHomeTabBarController(), animated: false)
    }
    
    private func showOnboardingViewController() {
        self.navigationController?.pushViewController(OnboardingViewController(), animated: true)
    }
}
