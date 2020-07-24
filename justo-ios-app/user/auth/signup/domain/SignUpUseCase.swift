import Foundation
import RxSwift

class SignUpUseCase {

    private let authRepository: AuthRepository

    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }

    func signUp(userRegister: UserRegister) -> Observable<User> {
        return authRepository.signUp(userRegister: userRegister)
    }
}
