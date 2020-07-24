import Foundation
import RxSwift

class ApplyCheckoutDiscountCodeUseCase {

    private let userRepository: UserRepository
    private let checkoutRepository: CheckoutRepository
    
    init(userRepository: UserRepository, checkoutRepository: CheckoutRepository) {
        self.userRepository = userRepository
        self.checkoutRepository = checkoutRepository
    }
    
    func applyCheckoutDiscountCode(discountCode: String) -> Observable<Checkout> {
        return userRepository.getOrFetchUser().flatMap { user in self.applyCheckoutDiscountCodeObservable(user: user, discountCode: discountCode)}
    }
    
    private func applyCheckoutDiscountCodeObservable(user: User, discountCode: String) -> Observable<Checkout> {
        let checkoutDiscountInput = CheckoutDiscountInput(checkoutId: user.userCheckout.id, discountCode: discountCode)
        return checkoutRepository.applyCheckoutDiscountCode(checkoutDiscountInput: checkoutDiscountInput)
    }
}
