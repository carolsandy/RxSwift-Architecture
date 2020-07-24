import Foundation
import UIKit
import RxSwift

class AddAddressUseCase {
    
    private let userRepository: UserRepository
    private let addressRepository: AddressRepository
    
    init(userRepository: UserRepository, addressRepository: AddressRepository) {
        self.userRepository = userRepository
        self.addressRepository = addressRepository
    }
    
    func addAddress(addressAddInput: AddressAddInput) -> Observable<[String]> {
        return userRepository.getOrFetchUser()
            .flatMap { user in self.addressRepository.addAddress(token: user.token, addressAddInput: addressAddInput) }.compactMap { data in data }
    }
}
