import Foundation
import RxSwift

class GetCheckoutUseCase {
    private let userRepository: UserRepository
    private let checkoutRepository: CheckoutRepository
    
    init(userRepository: UserRepository, checkoutRepository: CheckoutRepository) {
        self.userRepository = userRepository
        self.checkoutRepository = checkoutRepository
    }
    
    func fetchCheckout() -> Observable<Checkout> {
        return userRepository.getOrFetchUser().flatMap { user in self.checkoutRepository.fetchCheckout(checkoutInput: CheckoutConfirmationInput(token: user.token, checkoutToken: user.userCheckout.token)) }
    }
}
