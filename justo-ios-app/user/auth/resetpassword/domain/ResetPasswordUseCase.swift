import Foundation
import RxSwift

class ResetPasswordUseCase {

    private let authRepository: AuthRepository

    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }

    func setNewPassword(newPassword: NewPassword) -> Observable<[String]> {
        return authRepository.setNewPassword(newPassword: newPassword)
    }
}
