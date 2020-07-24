import Foundation
import RxSwift

class CloseSessionUseCase {
   
    private let userRepository: UserRepository
    private let authRepository: AuthRepository
    
    init(userRepository: UserRepository, authRepository: AuthRepository) {
        self.userRepository = userRepository
        self.authRepository = authRepository
    }
    
    func closeSession() -> Completable {
        return userRepository.getOrFetchUser().flatMap { user in self.authRepository.closeSession(jwtToken: user.token) }.ignoreElements()
    }
}
