import Foundation
import RxSwift

class RecoverAccountPresenter {

    fileprivate weak var recoverAccountUI: RecoverAccountUI?
    let recoverAccountUseCase: RecoverAccountUseCase
    let recoverAccountErrorHandler: RecoverAccountErrorHandler

    private let disposeBag = DisposeBag()

    init(recoverAccountUI: RecoverAccountUI, recoverAccountUseCase: RecoverAccountUseCase, recoverAccountErrorHandler: RecoverAccountErrorHandler) {
        self.recoverAccountUI = recoverAccountUI
        self.recoverAccountUseCase = recoverAccountUseCase
        self.recoverAccountErrorHandler = recoverAccountErrorHandler
    }

    func recoverPassword(recoverPassword: RecoverPassword) {
        self.recoverAccountUI?.resetFields()
        let isValidEmail = recoverAccountErrorHandler.isValidEmail(recoverPassword: recoverPassword)
        guard !isValidEmail.invalid else {
            self.recoverAccountUI?.showSignInError(isValidEmail.error); return }
        recoverAccountUI?.showLoader()
        recoverAccountUseCase.recoverPassword(recoverPassword: recoverPassword)
            .subscribe(onNext: { recoverPassword in
                self.recoverAccountUI?.hideLoader()
                if recoverPassword.isEmpty {
                    self.recoverAccountUI?.showSignInSuccess()
                } else {
                    self.recoverAccountUI?.showSignInError(RecoverPasswordError.graphQL(recoverPassword.first.orDefaultString()))
                }
            }, onError: { error in
                self.recoverAccountUI?.hideLoader()
                self.recoverAccountUI?.showSignInError(error)
            })
            .disposed(by: disposeBag)
    }
}

protocol RecoverAccountUI: class {

    func showLoader()

    func hideLoader()

    func showSignInSuccess()

    func showSignInError(_ errorType: Error)
    
    func resetFields()
}
