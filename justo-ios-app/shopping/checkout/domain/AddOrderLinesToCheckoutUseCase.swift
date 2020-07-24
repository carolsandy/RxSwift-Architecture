import Foundation
import RxSwift

class AddOrderLinesToCheckoutUseCase {
    private let checkoutRepository: CheckoutRepository
    private let userRepository: UserRepository
    
    init(checkoutRepository: CheckoutRepository, userRepository: UserRepository) {
        self.checkoutRepository = checkoutRepository
        self.userRepository = userRepository
    }
    
    func addOrderLinesToCheckout(orderId: String) -> Observable<Checkout> {
        return userRepository.getUser().flatMap { user in
            self.checkoutRepository.addOrderLinesToCheckout(token: user.token, orderId: orderId)
        }
    }
}
