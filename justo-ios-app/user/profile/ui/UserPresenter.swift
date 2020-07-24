import Foundation
import RxSwift

class UserPresenter : Presenter {
    
    internal typealias UI = UserUI
    weak var ui: UserUI?
    
    let getUserUseCase: GetUserUseCase
    let closeSessionUseCase: CloseSessionUseCase
    
    private let disposeBag = DisposeBag()
    
    init(getUserUseCase: GetUserUseCase, closeSessionUseCase: CloseSessionUseCase) {
        self.getUserUseCase = getUserUseCase
        self.closeSessionUseCase = closeSessionUseCase
    }
    
    func getUser() {
        guard let ui = ui else { return }
        getUserUseCase.getOrFetchUser().subscribe(onNext: { user in
            ui.showUserInfo(user: user)
        }, onError: { error in
            print(error)
        }).disposed(by: disposeBag)
    }
    
    func closeSession() {
        guard let ui = ui else { return }
        ui.showLoader()
        closeSessionUseCase.closeSession().subscribe(onCompleted: {
            ui.hideLoader()
            ui.backToHome()
        }, onError: { error in
            ui.hideLoader()
        }).disposed(by: disposeBag)
    }
}

protocol UserUI: LoadingUI {
    func showUserInfo(user: User)
    func backToHome()
}
