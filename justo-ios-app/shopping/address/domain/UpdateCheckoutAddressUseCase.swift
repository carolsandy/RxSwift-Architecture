import Foundation
import RxSwift

class UpdateCheckoutAddressUseCase {
    
    private let userRepository: UserRepository
    private let checkoutRepository: CheckoutRepository
    
    init(userRepository: UserRepository, checkoutRepository: CheckoutRepository) {
        self.userRepository = userRepository
        self.checkoutRepository = checkoutRepository
    }
    
    func updateCheckoutAddress(with shippingAddressId: String) -> Observable<Checkout> {
        return userRepository.getOrFetchUser().flatMap { user in
            self.updateCheckoutAddressObservable(with: user, and: shippingAddressId) }
    }
    
    func updateCheckoutAddressObservable(with user: User, and shippingAddressId: String) -> Observable<Checkout> {
        let checkoutAddressUpdateInput = CheckoutAddressUpdateInput(token: user.uuid, checkoutId: user.userCheckout.id, shippingAddressId: shippingAddressId)
        return checkoutRepository.updateCheckoutAddress(with: checkoutAddressUpdateInput)
    }
}
