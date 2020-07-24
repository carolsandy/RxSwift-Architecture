import Foundation
import RxSwift

class SignInUseCase {

    private let authRepository: AuthRepository

    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }

    func signIn(userCredentials: UserCredentials) -> Observable<User> {
       return authRepository.signIn(userCredentials: userCredentials)
    }
}
