import Foundation
import RxSwift

class UpdateUserUseCase {
   
    private let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func updateUser(userUpdate: UserUpdateInput) -> Observable<User>{
        return userRepository.getOrFetchUser().flatMap { user in self.userRepository.updateUser(token: user.token, userUpdate: userUpdate) }
    }
}
