import Foundation
import RxSwift

class HomeTabBarPresenter: Presenter {
    internal typealias UI = HomeTabBarUI
    weak var ui: HomeTabBarUI?
    
    let getUserUseCase: GetUserUseCase
    
    private let disposeBag = DisposeBag()
    
    init(getUserUseCase: GetUserUseCase) {
        self.getUserUseCase = getUserUseCase
    }
    
    func getUser() {
        guard let ui = ui else { return }
        getUserUseCase.getUser().subscribe(onNext: { user in
            ui.updateUserSignedIn(isUserAuthenticated: true)
        }, onError: { error in
            ui.updateUserSignedIn(isUserAuthenticated: false)
        }).disposed(by: disposeBag)
    }
}

protocol HomeTabBarUI: UI {
    func updateUserSignedIn(isUserAuthenticated: Bool)
}
