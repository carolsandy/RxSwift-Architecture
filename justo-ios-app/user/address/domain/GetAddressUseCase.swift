import Foundation
import UIKit
import RxSwift

class GetAddressUseCase {
    
    private let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func getAddresses() -> Observable<[Address]> {
        return userRepository.getOrFetchUser(forceFetchUser: true).compactMap { data in data.addresses }
    }
}
