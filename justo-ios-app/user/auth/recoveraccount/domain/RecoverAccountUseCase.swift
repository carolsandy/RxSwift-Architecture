import Foundation
import RxSwift

class RecoverAccountUseCase {

    private let authRepository: AuthRepository

    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }

    func recoverPassword(recoverPassword: RecoverPassword) -> Observable<[String]>{
        return authRepository.recoverPassword(recoverPassword: recoverPassword)
    }
}
