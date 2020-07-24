import Foundation
import RxSwift

class ClearCheckoutLinesUseCase {

    private let userRepository: UserRepository
    private let checkoutRepository: CheckoutRepository
    
    init(userRepository: UserRepository, checkoutRepository: CheckoutRepository) {
        self.userRepository = userRepository
        self.checkoutRepository = checkoutRepository
    }
    
    func clearCheckoutLines() -> Observable<Checkout> {
        return userRepository.getOrFetchUser().flatMap { user in self.clearCheckoutLinesObservable(user: user)}
    }
    
    private func clearCheckoutLinesObservable(user: User) -> Observable<Checkout> {
        let checkoutClearInput = CheckoutClearInput(token: user.token, checkoutId: user.userCheckout.id)
        return checkoutRepository.clearCheckoutLines(checkoutClearInput: checkoutClearInput).flatMap { checkout in
            self.userRepository.updateCheckout(checkout: checkout).andThen(Observable.just(checkout))
        }
    }
}
