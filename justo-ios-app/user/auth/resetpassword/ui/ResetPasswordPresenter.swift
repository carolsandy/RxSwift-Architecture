import Foundation
import RxSwift

class ResetPasswordPresenter {

    fileprivate weak var resetPasswordUI: ResetPasswordUI?
    let resetPasswordUseCase: ResetPasswordUseCase

    private let disposeBag = DisposeBag()

    init(resetPasswordUI: ResetPasswordUI, resetPasswordUseCase: ResetPasswordUseCase) {
        self.resetPasswordUI = resetPasswordUI
        self.resetPasswordUseCase = resetPasswordUseCase
    }

    func setNewPassword(setNewPassword: NewPassword) {
        resetPasswordUI?.showLoader()
        resetPasswordUseCase.setNewPassword(newPassword: setNewPassword)
            .subscribe(onNext: { passwordSet in
                self.resetPasswordUI?.hideLoader()
                if passwordSet.isEmpty {
                    self.resetPasswordUI?.showResetPasswordSucces()
                } else {
                    self.resetPasswordUI?.showResetPasswordError(message: passwordSet.first.orDefaultString())
                }
            }, onError: { error in
                print(error.localizedDescription)
            }).disposed(by: disposeBag)
    }
}

protocol ResetPasswordUI: class {

    func showLoader()

    func hideLoader()

    func showResetPasswordSucces()

    func showResetPasswordError(message: String)
}
