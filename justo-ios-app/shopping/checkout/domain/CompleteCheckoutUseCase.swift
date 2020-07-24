import Foundation
import RxSwift

class CompleteCheckoutUseCase {
    
    private let userRepository: UserRepository
    private let checkoutRepository: CheckoutRepository
    
    init(userRepository: UserRepository, checkoutRepository: CheckoutRepository) {
        self.userRepository = userRepository
        self.checkoutRepository = checkoutRepository
    }
    
    func completeCheckout(note: String) -> Observable<CheckoutOrder> {
        return userRepository.getOrFetchUser().flatMap { user in
            (note.isEmpty) ? self.completeCheckout(user: user) : self.completeCheckoutWithNoteObservable(user: user, note: note)
        }
    }
    
    private func completeCheckout(user: User) -> Observable<CheckoutOrder> {
        let checkoutCompleteInput = CheckoutCompleteInput(token: user.token, checkoutId: user.userCheckout.id)
        return checkoutRepository.completeCheckout(checkoutCompleteInput: checkoutCompleteInput).flatMap { checkoutOrder in
            self.userRepository.updateCheckout(checkout: Checkout()).andThen(Observable.just(checkoutOrder))
        }
    }
    
    private func completeCheckoutWithNoteObservable(user: User, note: String) -> Observable<CheckoutOrder> {
        let checkoutNoteInput = CheckoutNoteInput(token: user.token, checkoutId: user.userCheckout.id, note: note)
        return checkoutRepository.addCheckoutNote(checkoutNoteInput: checkoutNoteInput).flatMap { _ in self.completeCheckout(user: user)}
    }
}
