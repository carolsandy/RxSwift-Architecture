import Foundation

struct CheckoutInput {
    var checkoutUser: CheckoutUser
    var checkoutLineUpdate: CheckoutLineUpdate
}

struct CheckoutUser {
    var token: String
    var email: String
}

struct CheckoutUpdateInput {
    var token: String
    var checkoutId: String
    var checkoutLineUpdate: CheckoutLineUpdate
}

struct CheckoutClearInput {
    var token: String
    var checkoutId: String
}

struct CheckoutLineUpdate {
    var quantity: Int
    var variantId: String
}

struct CheckoutAddressUpdateInput {
    var token: String
    var checkoutId: String
    var shippingAddressId: String
}

struct CheckoutShippingMethodInput {
    var token: String
    var checkoutId: String
    var shippingMethodId: String
    var develiveryDate: String
}

struct ShippingMethod {
    var id: String
    var price: Double
    
    init(id: String = StringConstants.empty, price: Double = .zero) {
        self.id = id
        self.price = price
    }
}

class UpdateCheckoutPaymentInput {
    var discountCode: String
    var paymentToken: String
    var deviceSessionId: String
    var shouldSave: Bool
    
    init(discountCode: String = StringConstants.empty, paymentToken: String = StringConstants.empty, deviceSessionId: String = StringConstants.empty, shouldSave: Bool) {
        self.discountCode = discountCode
        self.paymentToken = paymentToken
        self.deviceSessionId = deviceSessionId
        self.shouldSave = shouldSave
    }
}

struct CheckoutPaymentInput {
    var token: String
    var checkoutId: String
    var paymentToken: String
    var deviceSessionId: String
    var shouldSave: Bool
}

struct CheckoutDiscountInput {
    var checkoutId: String
    var discountCode: String
}

struct CheckoutConfirmationInput {
    var token: String
    var checkoutToken: String
}

struct CheckoutNoteInput {
    var token: String
    var checkoutId: String
    var note: String
}

struct CheckoutCompleteInput {
    var token: String
    var checkoutId: String
}

struct Checkout {
    var id: String
    var token: String
    var quantity: Int
    var checkoutLines: [CheckoutLine]
    var total: Double
    var subtotal: Double
    var shippingPrice: String
    var discountAmount: String
    var totalPrice: String
    var owner: String
    var shippingAddress: Address
    var shippingMethod: ShippingMethod
    var paymentId: String
    var deliveryDate: String
    var errors: [String]
    
    init(id: String = StringConstants.empty, token: String = StringConstants.empty,
         quantity: String = StringConstants.empty, checkoutLines: [CheckoutLine] = [],
         total: Double = DoubleConstants.defaultDouble,
         subtotal: Double = DoubleConstants.defaultDouble, shippingPrice: String = StringConstants.empty,
         discountAmount: String = StringConstants.empty, totalPrice: String = StringConstants.empty,
         owner: String = StringConstants.empty, shippingAddress: Address = Address(),
         shippingMethod: ShippingMethod = ShippingMethod(), paymentId: String = StringConstants.empty, deliveryDate: String = StringConstants.empty,
         errors: [String] = []) {
        self.id = id
        self.token = token
        self.quantity = Int(quantity) ?? .zero
        self.checkoutLines = checkoutLines
        self.total = total
        self.subtotal = subtotal
        self.shippingPrice = shippingPrice
        self.discountAmount = discountAmount
        self.totalPrice = totalPrice
        self.owner = owner
        self.shippingAddress = shippingAddress
        self.shippingMethod = shippingMethod
        self.paymentId = paymentId
        self.deliveryDate = deliveryDate
        self.errors =  errors
    }
}

struct CheckoutLine {
    var quantity: Int
    var totalPrice: Double
    var checkoutVariant: CheckoutVariant
}

struct CheckoutVariant {
    var id: String
    var productName: String
    var productImageUrl: String
    var name: String
    var price: Double
    var weight: Double
}

struct CheckoutOrder {
    var number: String
    var isPaid: Bool
    var paymentStatus: String
    var errors: [String]
}

extension CheckoutInput {
    
    func asCreateCheckoutMutation() -> CreateCheckoutMutation {
        return CreateCheckoutMutation(checkoutCreateInput: CheckoutCreateInput(lines: checkoutLineUpdate.asCheckoutLineInputArray(), email: checkoutUser.email))
    }
}

extension CheckoutUpdateInput {

    func asCheckoutLinesUpdateMutation() -> CheckoutLinesUpdateMutation {
        return CheckoutLinesUpdateMutation(checkoutId: checkoutId, lines: checkoutLineUpdate.asCheckoutLineInputArray())
    }
}

extension CheckoutLineUpdate {
   
    func asCheckoutLineInputArray() -> [CheckoutLineInput] {
        return [CheckoutLineInput(quantity: quantity, variantId: variantId)]
    }
    
    private func asCheckoutLineInput() -> CheckoutLineInput {
        return CheckoutLineInput(quantity: quantity, variantId: variantId)
    }
}

extension CheckoutClearInput {
    
    func asCheckoutCleanLinesMutation() -> CleanCheckoutLinesMutation {
        return CleanCheckoutLinesMutation(checkoutId: checkoutId)
    }
}

extension CheckoutAddressUpdateInput{
    
    func asCheckoutAddressUpdateMutation() -> CheckoutAddressUpdateMutation {
        return CheckoutAddressUpdateMutation(checkoutId: checkoutId, shippingAddressId: shippingAddressId)
    }
}

extension CheckoutShippingMethodInput {
    
    func asCheckoutShippingMethodUpdateMutation() -> CheckoutShippingMethodUpdateMutation {
        return CheckoutShippingMethodUpdateMutation(checkoutId: checkoutId, shippingMethodId: shippingMethodId, deliveryDate: develiveryDate)
    }
}

extension CheckoutPaymentInput {
    
    func asCheckoutPaymentAddMutation() -> CheckoutPaymentAddMutation {
        return CheckoutPaymentAddMutation(checkoutId: checkoutId, input: PaymentInput(gateway: GatewaysEnum.openpay, token: paymentToken, deviceSessionId: deviceSessionId, saveCard: shouldSave, saveAsDefault: shouldSave))
    }
    
    func asCheckoutSavedPaymentAddMutation() -> AddCheckoutPaymentSavedMutation {
        return AddCheckoutPaymentSavedMutation(checkoutId: checkoutId, cardId: paymentToken, deviceSessionId: deviceSessionId)
    }
}

extension CheckoutDiscountInput {
    
    func asCheckoutDiscountCodeMutation() -> DiscountCodeMutation {
        return DiscountCodeMutation(checkoutId: checkoutId, discountCode: discountCode)
    }
}

extension CheckoutNoteInput {
    
    func asCheckoutNoteAddMutation() -> CheckoutNoteAddMutation {
        return CheckoutNoteAddMutation(checkoutId: checkoutId, note: note)
    }
}

extension CheckoutCompleteInput {
    
    func asCheckoutCompleteMutation() -> CheckoutCompleteMutation {
        return CheckoutCompleteMutation(checkoutId: checkoutId)
    }
}
