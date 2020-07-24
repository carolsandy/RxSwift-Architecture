import Foundation
import Apollo
import RxSwift

class CheckoutRemoteDataSource {
   
    private let apolloClientBuilder: ApolloClientBuilder
    
    init(apolloClientBuilder: ApolloClientBuilder) {
        self.apolloClientBuilder = apolloClientBuilder
    }
    
    func createCheckout(token: String, createCheckoutMutation: CreateCheckoutMutation) -> Observable<CreateCheckoutMutation.Data.CheckoutCreate> {
        return apolloClientBuilder.createApolloClientWith(token: token).apolloRX.perform(mutation: createCheckoutMutation)
            .compactMap { data in data.checkoutCreate }
    }

    func addOrderLinesToCheckout(token: String, addOrderLinesToCheckoutMutation: AddOrderLinesToCheckoutMutation) -> Observable<AddOrderLinesToCheckoutMutation.Data.AddOrderLinesToCheckout> {
        return apolloClientBuilder.createApolloClientWith(token: token).apolloRX.perform(mutation: addOrderLinesToCheckoutMutation).compactMap { data in data.addOrderLinesToCheckout }
    }

    func updateCheckoutLines(token: String, checkoutLinesUpdateMutation: CheckoutLinesUpdateMutation) -> Observable<CheckoutLinesUpdateMutation.Data.CheckoutLinesUpdate> {
        return apolloClientBuilder.createApolloClientWith(token: token).apolloRX.perform(mutation: checkoutLinesUpdateMutation)
            .compactMap { data in data.checkoutLinesUpdate }
    }
    
    func clearCheckoutLines(token: String, cleanCheckoutLinesMutation: CleanCheckoutLinesMutation) -> Observable<CleanCheckoutLinesMutation.Data.CheckoutCleanLine> {
        return apolloClientBuilder.createApolloClientWith(token: token).apolloRX.perform(mutation: cleanCheckoutLinesMutation)
            .compactMap { data in data.checkoutCleanLines }
    }
    
    func updateCheckoutAddress(with token: String, and checkoutAddressUpdateMutation: CheckoutAddressUpdateMutation) -> Observable<CheckoutAddressUpdateMutation.Data.CheckoutShippingAddressUpdate> {
        return apolloClientBuilder.createApolloClientWith(token: token).apolloRX.perform(mutation: checkoutAddressUpdateMutation)
            .compactMap { data in data.checkoutShippingAddressUpdate }
    }
    
    func updateCheckoutShippingMethod(token: String, checkoutShippingMethodUpdateMutation: CheckoutShippingMethodUpdateMutation) -> Observable<CheckoutShippingMethodUpdateMutation.Data.CheckoutShippingMethodUpdate> {
        return apolloClientBuilder.createApolloClientWith(token: token).apolloRX.perform(mutation: checkoutShippingMethodUpdateMutation)
            .compactMap { data in data.checkoutShippingMethodUpdate }
    }
    
    func addCheckoutPayment(token: String, checkoutPaymentAddMutation: CheckoutPaymentAddMutation) -> Observable<CheckoutPaymentAddMutation.Data.CheckoutPaymentCreate> {
        return apolloClientBuilder.createApolloClientWith(token: token).apolloRX.perform(mutation: checkoutPaymentAddMutation)
            .compactMap { data in data.checkoutPaymentCreate }
    }
    
    func addCheckoutSavedPayment(token: String, addCheckoutPaymentSavedMutation: AddCheckoutPaymentSavedMutation) -> Observable<AddCheckoutPaymentSavedMutation.Data.CheckoutAddSavedCard> {
        return apolloClientBuilder.createApolloClientWith(token: token).apolloRX.perform(mutation: addCheckoutPaymentSavedMutation)
            .compactMap { data in data.checkoutAddSavedCard }
    }
    
    func applyCheckoutDiscountCode(discountCodeMutation: DiscountCodeMutation) -> Observable<DiscountCodeMutation.Data.CheckoutUpdateVoucher> {
        return apolloClientBuilder.buildDefault().apolloRX.perform(mutation: discountCodeMutation)
            .compactMap { data in data.checkoutUpdateVoucher }
    }
    
    func fetchCheckout(token: String, checkoutToken: String) -> Observable<FetchCheckoutQueryQuery.Data.Checkout> {
        return apolloClientBuilder.createApolloClientWith(token: token).apolloRX.fetch(query: FetchCheckoutQueryQuery(token: checkoutToken)).compactMap { data in data.checkout }
    }
    
    func addCheckoutNote(token: String, checkoutNoteAddMutation: CheckoutNoteAddMutation) -> Observable<CheckoutNoteAddMutation.Data.CheckoutUpdateNote> {
        return apolloClientBuilder.createApolloClientWith(token: token).apolloRX.perform(mutation: checkoutNoteAddMutation)
            .compactMap { data in data.checkoutUpdateNote }
    }
    
    func completeCheckout(token: String, checkoutCompleteMutation: CheckoutCompleteMutation) -> Observable<CheckoutCompleteMutation.Data.CheckoutComplete> {
        return apolloClientBuilder.createApolloClientWith(token: token).apolloRX.perform(mutation: checkoutCompleteMutation)
            .compactMap { data in data.checkoutComplete }
    }
}
