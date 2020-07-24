import Foundation
import RxSwift

class UpdateCheckoutShippingMethodUseCase {
    
    private let userRepository: UserRepository
    private let checkoutRepository: CheckoutRepository
    
    init(userRepository: UserRepository, checkoutRepository: CheckoutRepository) {
        self.userRepository = userRepository
        self.checkoutRepository = checkoutRepository
    }
    
    func updateCheckoutShippingMethod(shippingMethodId: String, deliveryDate: String) -> Observable<Checkout> {
        return userRepository.getOrFetchUser().flatMap { user in self.updateCheckoutShippingMethodObservable(user: user, shippingMethodId: shippingMethodId, deliveryDate: deliveryDate) }
    }
    
    func updateCheckoutShippingMethodObservable(user: User, shippingMethodId: String, deliveryDate: String ) -> Observable<Checkout> {
        let checkoutShippingMethodInput = CheckoutShippingMethodInput(token: user.token, checkoutId: user.userCheckout.id, shippingMethodId: shippingMethodId, develiveryDate: deliveryDate)
        return checkoutRepository.updateCheckoutShippingMethod(checkoutShippingMethodInput: checkoutShippingMethodInput)
    }
}
