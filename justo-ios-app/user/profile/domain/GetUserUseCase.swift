import Foundation
import RxSwift

class GetUserUseCase {
   
    private let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func getOrFetchUser(forceFetchUser: Bool = false) -> Observable<User> {
        return userRepository.getOrFetchUser(forceFetchUser: forceFetchUser)
    }
    
    func getUser(forceFetchUser: Bool = false) -> Observable<User> {
        return userRepository.getUser()
    }
}
