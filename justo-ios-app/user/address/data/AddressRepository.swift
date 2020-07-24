import Foundation
import RxSwift

class AddressRepository {
    
    private let addressRemoteDataSource: AddressRemoteDataSource
    
    init(addressRemoteDataSource: AddressRemoteDataSource) {
        self.addressRemoteDataSource = addressRemoteDataSource
    }
    
    func addAddress(token: String, addressAddInput: AddressAddInput) -> Observable<[String]> {
        return addressRemoteDataSource.addAddress(token: token, addressAddMutation: addressAddInput.asAddressAddMutation())
    }
    
}
