import Foundation
import RxSwift

class UpdatePasswordUseCase {
    
    private let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func updatePassword(passwordUpdateInput: PasswordUpdateInput) -> Observable<[String]> {
        return userRepository.getOrFetchUser().flatMap { user in self.userRepository.updatePassword(token: user.token, passwordUpdate: passwordUpdateInput) }
    }
}
