import Foundation

extension UIRefreshControl {
    
    func configureRefreshControl(action: Selector, target: Any) -> UIRefreshControl {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(target, action: action, for: .valueChanged)
        return refreshControl
    }
}
