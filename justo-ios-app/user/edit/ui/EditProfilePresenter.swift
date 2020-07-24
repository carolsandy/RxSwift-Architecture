import Foundation
import RxSwift

class EditUserProfilePresenter {
    weak var ui: EditProfileUI?
    private let getUserUseCase: GetUserUseCase
    private let updateUserUseCase: UpdateUserUseCase
    let editProfileErrorHandler: EditProfileErrorHandler
    
    private let disposeBag = DisposeBag()
    
    init(getUserUseCase: GetUserUseCase, updateUserUseCase: UpdateUserUseCase, editProfileErrorHandler: EditProfileErrorHandler) {
        self.getUserUseCase = getUserUseCase
        self.updateUserUseCase = updateUserUseCase
        self.editProfileErrorHandler = editProfileErrorHandler
    }
    
    func getUser() {
        getUserUseCase.getUser().subscribe(onNext: { user in
            self.ui?.showUserInfo(user: user)
        }, onError: { error in
            print(error)
        }).disposed(by: disposeBag)
    }
    
    func updateUser(userUpdate: UserUpdateInput) {
        ui?.resetFields()
        let isUserUpdateValid = editProfileErrorHandler.isUserUpdateValid(userUpdate: userUpdate)
        guard !isUserUpdateValid.error else { self.ui?.showEditProfileError(isUserUpdateValid.message); return }
        ui?.showLoader()
        updateUserUseCase.updateUser(userUpdate: userUpdate).subscribe(onNext: { user in
            self.ui?.hideLoader()
            self.ui?.goToUpdatedAccount()
        }, onError: { error in
            self.ui?.hideLoader()
            self.ui?.showEditProfileError(error)
        }).disposed(by: disposeBag)
    }
}

protocol EditProfileUI: LoadingUI {
    func showUserInfo(user: User)
    func showEditProfileError(_ errorType: Error)
    func goToUpdatedAccount()
    func resetFields()
}
