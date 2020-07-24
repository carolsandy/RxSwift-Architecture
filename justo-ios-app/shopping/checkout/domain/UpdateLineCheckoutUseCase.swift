
import Foundation
import RxSwift

class UpdateLineCheckoutUseCase {
    
    private let userRepository: UserRepository
    private let checkoutRepository: CheckoutRepository
    
    init(userRepository: UserRepository, checkoutRepository: CheckoutRepository) {
        self.userRepository = userRepository
        self.checkoutRepository = checkoutRepository
    }
    
    func updateCheckoutLine(checkoutLineUpdate: CheckoutLineUpdate) -> Observable<Checkout> {
        return userRepository.getOrFetchUser()
            .flatMap { user in
            (!user.userCheckout.id.isEmpty)
                ? self.updateCheckoutLineObservable(user: user, checkoutLineUpdate: checkoutLineUpdate)
                : self.createCheckoutObservable(user: user, checkoutLineUpdate: checkoutLineUpdate)
        }
    }
    
    private func createCheckoutObservable(user: User, checkoutLineUpdate: CheckoutLineUpdate) -> Observable<Checkout> {
        let checkoutInput = CheckoutInput(checkoutUser: CheckoutUser(token: user.token, email: user.email), checkoutLineUpdate: checkoutLineUpdate)
        return checkoutRepository.createCheckout(checkoutInput: checkoutInput)
    }
    
    private func updateCheckoutLineObservable(user: User, checkoutLineUpdate: CheckoutLineUpdate) -> Observable<Checkout> {
        let checkoutUpdateInput = CheckoutUpdateInput(token: user.token, checkoutId: user.userCheckout.id, checkoutLineUpdate: checkoutLineUpdate)
        return checkoutRepository.updateCheckoutLine(checkoutUpdateInput: checkoutUpdateInput)
    }
}


