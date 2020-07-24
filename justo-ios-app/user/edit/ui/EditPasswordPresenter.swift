import Foundation
import RxSwift

class EditPasswordPresenter {
    weak var ui: EditPasswordUI?
    var updatePasswordUseCase: UpdatePasswordUseCase
    let editPasswordErrorHandler: EditPasswordErrorHandler
    
    var disposeBag = DisposeBag()
    
    init(updatePasswordUseCase: UpdatePasswordUseCase, editPasswordErrorHandler: EditPasswordErrorHandler) {
        self.updatePasswordUseCase = updatePasswordUseCase
        self.editPasswordErrorHandler = editPasswordErrorHandler
    }
    
    func editPassword(passwordUpdateInput: PasswordUpdateInput) {
        ui?.resetFields()
        let isPasswordUpdateValid = editPasswordErrorHandler.isPasswordUpdateValid(passwordUpdate: passwordUpdateInput)
        guard !isPasswordUpdateValid.error else { self.ui?.showEditPasswordError(isPasswordUpdateValid.message) ;return }
        ui?.showLoader()
        updatePasswordUseCase.updatePassword(passwordUpdateInput: passwordUpdateInput).subscribe(onNext: { updatePassword in
            self.ui?.hideLoader()
            if updatePassword.isEmpty {
                self.ui?.passwordUpdatedSuccessfully()
            } else {
                self.ui?.showEditPasswordError(EditPasswordError.graphQL(.localizeString(for: updatePassword.first ?? StringConstants.empty)))
            }
        }, onError: { error in
            self.ui?.hideLoader()
            self.ui?.showEditPasswordError(error)
        }).disposed(by: disposeBag)
    }
}

protocol EditPasswordUI: LoadingUI {
    func passwordUpdatedSuccessfully()
    func showEditPasswordError(_ errorType: Error)
    func resetFields()
}
