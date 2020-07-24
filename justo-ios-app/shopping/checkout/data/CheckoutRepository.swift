import Foundation
import RxSwift

class CheckoutRepository {
    
    private let checkoutRemoteDataSource: CheckoutRemoteDataSource
    
    init(checkoutRemoteDataSource: CheckoutRemoteDataSource) {
        self.checkoutRemoteDataSource = checkoutRemoteDataSource
    }
    
    func createCheckout(checkoutInput: CheckoutInput) -> Observable<Checkout> {
        return checkoutRemoteDataSource.createCheckout(token: checkoutInput.checkoutUser.token, createCheckoutMutation: checkoutInput.asCreateCheckoutMutation())
            .map { checkoutCreate in CheckoutMapping.mapCheckout(checkoutCreate: checkoutCreate) }
    }

    func addOrderLinesToCheckout(token: String, orderId: String) -> Observable<Checkout> {
        return checkoutRemoteDataSource.addOrderLinesToCheckout(token: token,
                                                                addOrderLinesToCheckoutMutation: AddOrderLinesToCheckoutMutation(id: orderId)).map { orderCheckout in CheckoutMapping.mapCheckout(orderCheckout: orderCheckout) }
    }

    func updateCheckoutLine(checkoutUpdateInput: CheckoutUpdateInput) -> Observable<Checkout> {
        return checkoutRemoteDataSource.updateCheckoutLines(token: checkoutUpdateInput.token, checkoutLinesUpdateMutation: checkoutUpdateInput.asCheckoutLinesUpdateMutation())
            .map { checkoutLinesUpdate in CheckoutMapping.mapCheckout(checkoutLinesUpdate: checkoutLinesUpdate) }
    }
    
    func clearCheckoutLines(checkoutClearInput: CheckoutClearInput) -> Observable<Checkout> {
        return checkoutRemoteDataSource.clearCheckoutLines(token: checkoutClearInput.token, cleanCheckoutLinesMutation: checkoutClearInput.asCheckoutCleanLinesMutation())
            .map { clearCheckoutLine in CheckoutMapping.mapCheckout(checkoutCleanLine: clearCheckoutLine) }
    }
    
    func updateCheckoutAddress(with checkoutAddressUpdateInput: CheckoutAddressUpdateInput) -> Observable<Checkout> {
        return checkoutRemoteDataSource.updateCheckoutAddress(with: checkoutAddressUpdateInput.token, and: checkoutAddressUpdateInput.asCheckoutAddressUpdateMutation())
            .map { checkoutAddressUpdate in CheckoutMapping.mapCheckout(checkoutAddressUpdate: checkoutAddressUpdate) }
    }
    
    func updateCheckoutShippingMethod(checkoutShippingMethodInput: CheckoutShippingMethodInput) -> Observable<Checkout> {
        return checkoutRemoteDataSource.updateCheckoutShippingMethod(token: checkoutShippingMethodInput.token,
                                                                     checkoutShippingMethodUpdateMutation: checkoutShippingMethodInput.asCheckoutShippingMethodUpdateMutation())
            .map { checkoutShippingMethodUpdate in CheckoutMapping.mapCheckout(checkoutShippingMethodUpdate: checkoutShippingMethodUpdate) }
    }
    
    func addCheckoutPayment(checkoutPaymentInput: CheckoutPaymentInput) -> Observable<Checkout> {
        return checkoutRemoteDataSource.addCheckoutPayment(token: checkoutPaymentInput.token, checkoutPaymentAddMutation: checkoutPaymentInput.asCheckoutPaymentAddMutation())
            .map { checkoutPaymentCreate in CheckoutMapping.mapCheckout(checkoutPaymentCreate: checkoutPaymentCreate) }
    }
    
    func addCheckoutSavedPayment(checkoutPaymentInput: CheckoutPaymentInput) -> Observable<Checkout> {
        return checkoutRemoteDataSource.addCheckoutSavedPayment(token: checkoutPaymentInput.token, addCheckoutPaymentSavedMutation: checkoutPaymentInput.asCheckoutSavedPaymentAddMutation())
            .map { checkoutAddSavedCard in CheckoutMapping.mapCheckout(checkoutAddSavedCard: checkoutAddSavedCard) }
    }
    
    func applyCheckoutDiscountCode(checkoutDiscountInput: CheckoutDiscountInput) -> Observable<Checkout> {
        return checkoutRemoteDataSource.applyCheckoutDiscountCode(discountCodeMutation: checkoutDiscountInput.asCheckoutDiscountCodeMutation())
            .map { checkoutUpdateVoucher in CheckoutMapping.mapCheckout(checkoutUpdateVoucher: checkoutUpdateVoucher) }
    }
    
    func fetchCheckout(checkoutInput: CheckoutConfirmationInput) -> Observable<Checkout> {
        return checkoutRemoteDataSource.fetchCheckout(token: checkoutInput.token, checkoutToken: checkoutInput.checkoutToken).map { checkout in CheckoutMapping.mapCheckout(checkout: checkout) }
    }
    
    func addCheckoutNote(checkoutNoteInput: CheckoutNoteInput) -> Observable<Checkout> {
        return checkoutRemoteDataSource.addCheckoutNote(token: checkoutNoteInput.token, checkoutNoteAddMutation: checkoutNoteInput.asCheckoutNoteAddMutation())
            .map { checkoutUpdateNote in CheckoutMapping.mapCheckout(checkoutUpdateNote: checkoutUpdateNote) }
    }
    
    func completeCheckout(checkoutCompleteInput: CheckoutCompleteInput) -> Observable<CheckoutOrder> {
        return checkoutRemoteDataSource.completeCheckout(token: checkoutCompleteInput.token, checkoutCompleteMutation: checkoutCompleteInput.asCheckoutCompleteMutation())
            .map { checkoutComplete in CheckoutMapping.mapCheckout(checkoutComplete: checkoutComplete) }
    }
}
