import Foundation
import RxSwift

class AddCheckoutPaymentUseCase {
    
    private let userRepository: UserRepository
    private let openPayRepository: OpenPayRepository
    private let checkoutRepository: CheckoutRepository
    
    init(userRepository: UserRepository, openPayRepository: OpenPayRepository, checkoutRepository: CheckoutRepository) {
        self.userRepository = userRepository
        self.openPayRepository = openPayRepository
        self.checkoutRepository = checkoutRepository
    }
    
    func addCheckoutPayment(updateCheckoutPaymentInput: UpdateCheckoutPaymentInput, isSaved: Bool = false) -> Observable<Checkout> {
        return userRepository.getOrFetchUser().flatMap { user in
            updateCheckoutPaymentInput.discountCode.isEmpty
                ? self.addCheckoutPayment(user: user, updateCheckoutPaymentInput: updateCheckoutPaymentInput, isSaved: isSaved)
                : self.addCheckoutPaymentWithDiscountCode(user: user, updateCheckoutPaymentInput: updateCheckoutPaymentInput, isSaved: isSaved)
        }
    }
    
    func addCheckoutPayment(user: User, updateCheckoutPaymentInput: UpdateCheckoutPaymentInput, isSaved: Bool = false) -> Observable<Checkout> {
        return openPayRepository.createDeviceSessionId().flatMap { deviceId in
            isSaved
                ? self.addCheckoutPaymentSavedObservable(user: user, deviceId: deviceId, updateCheckoutPaymentInput: updateCheckoutPaymentInput)
                : self.addCheckoutPaymentObservable(user: user, deviceId: deviceId, updateCheckoutPaymentInput: updateCheckoutPaymentInput)
        }
    }
    
    func addCheckoutPaymentObservable(user: User, deviceId: String, updateCheckoutPaymentInput: UpdateCheckoutPaymentInput) -> Observable<Checkout> {
        let checkoutPaymentInput = CheckoutPaymentInput(token: user.token, checkoutId: user.userCheckout.id, paymentToken: updateCheckoutPaymentInput.paymentToken, deviceSessionId: deviceId, shouldSave: updateCheckoutPaymentInput.shouldSave)
        return checkoutRepository.addCheckoutPayment(checkoutPaymentInput: checkoutPaymentInput)
    }
    
    func addCheckoutPaymentSavedObservable(user: User, deviceId: String, updateCheckoutPaymentInput: UpdateCheckoutPaymentInput) -> Observable<Checkout> {
        let checkoutPaymentInput = CheckoutPaymentInput(token: user.token, checkoutId: user.userCheckout.id, paymentToken: updateCheckoutPaymentInput.paymentToken, deviceSessionId: deviceId, shouldSave: updateCheckoutPaymentInput.shouldSave)
        return checkoutRepository.addCheckoutSavedPayment(checkoutPaymentInput: checkoutPaymentInput)
    }
    
    private func addCheckoutPaymentWithDiscountCode(user: User, updateCheckoutPaymentInput: UpdateCheckoutPaymentInput, isSaved: Bool = false) -> Observable<Checkout> {
        let checkoutDiscountInput = CheckoutDiscountInput(checkoutId: user.userCheckout.id, discountCode: updateCheckoutPaymentInput.discountCode)
        return checkoutRepository.applyCheckoutDiscountCode(checkoutDiscountInput: checkoutDiscountInput).flatMap { checkout in
            checkout.errors.isEmpty
                ? self.addCheckoutPayment(user: user, updateCheckoutPaymentInput: updateCheckoutPaymentInput, isSaved: isSaved)
                : Observable.just(checkout)
        }
    }
}
