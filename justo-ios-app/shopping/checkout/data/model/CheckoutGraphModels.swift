import Foundation

struct CheckoutMapping {
    
    static func mapCheckout(checkoutCreate: CreateCheckoutMutation.Data.CheckoutCreate?) -> Checkout {
        return Checkout(id: checkoutCreate?.checkout?.id ?? StringConstants.empty,
                        token: checkoutCreate?.checkout?.token ?? StringConstants.empty,
                        quantity: String(checkoutCreate?.checkout?.quantity ?? .zero),
                        errors: checkoutCreate?.errors?.compactMap { error in error.message } ?? [])
    }

    static func mapCheckout(orderCheckout: AddOrderLinesToCheckoutMutation.Data.AddOrderLinesToCheckout) -> Checkout {
        return Checkout(id: orderCheckout.checkout?.id ?? StringConstants.empty,
                        token: orderCheckout.checkout?.token ?? StringConstants.empty,
                        quantity: String(orderCheckout.checkout?.quantity ?? .zero),
                        errors: orderCheckout.errors?.compactMap { error in error.message } ?? [])
    }

    static func mapCheckout(checkoutLinesUpdate: CheckoutLinesUpdateMutation.Data.CheckoutLinesUpdate?) -> Checkout {
        return Checkout(id: checkoutLinesUpdate?.checkout?.id ?? StringConstants.empty,
                        token: checkoutLinesUpdate?.checkout?.token ?? StringConstants.empty,
                        quantity: String(checkoutLinesUpdate?.checkout?.quantity ?? .zero),
                        checkoutLines: checkoutLinesUpdate?.checkout?.lines?.compactMap { line in line?.asLine() } ?? [],
                        total: checkoutLinesUpdate?.checkout?.totalPrice?.gross.amount ?? DoubleConstants.defaultDouble,
                        subtotal: checkoutLinesUpdate?.checkout?.subtotalPrice?.gross.amount ?? DoubleConstants.defaultDouble,
                        errors: checkoutLinesUpdate?.errors?.compactMap { error in error.message } ?? [])
    }
    
    static func mapCheckout(checkoutCleanLine: CleanCheckoutLinesMutation.Data.CheckoutCleanLine?) -> Checkout {
        return Checkout(id: checkoutCleanLine?.checkout?.id ?? StringConstants.empty,
                        token: checkoutCleanLine?.checkout?.token ?? StringConstants.empty,
                        quantity: String(checkoutCleanLine?.checkout?.quantity ?? .zero),
                        errors: checkoutCleanLine?.errors?.compactMap { error in error.message } ?? [])
    }
    
    static func mapCheckout(checkoutAddressUpdate: CheckoutAddressUpdateMutation.Data.CheckoutShippingAddressUpdate?) -> Checkout {
        return Checkout(id: checkoutAddressUpdate?.checkout?.id ?? StringConstants.empty,
                        token: checkoutAddressUpdate?.checkout?.token ?? StringConstants.empty,
                        quantity: StringConstants.empty,
                        checkoutLines: [],
                        subtotal: .zero,
                        shippingAddress: checkoutAddressUpdate?.checkout?.shippingAddress?.asShippingAddress() ?? Address(),
                        shippingMethod: checkoutAddressUpdate?.checkout?.availableShippingMethods.compactMap { method in method?.asShippingMethod() }.first ?? ShippingMethod(),
                        errors: checkoutAddressUpdate?.errors?.compactMap { error in error.message } ?? [])
    }
    
    static func mapCheckout(checkoutShippingMethodUpdate: CheckoutShippingMethodUpdateMutation.Data.CheckoutShippingMethodUpdate?) -> Checkout {
        return Checkout(id: checkoutShippingMethodUpdate?.checkout?.id ?? StringConstants.empty,
                        token: checkoutShippingMethodUpdate?.checkout?.token ?? StringConstants.empty,
                        errors: checkoutShippingMethodUpdate?.errors?.compactMap { error in error.message } ?? [])
    }
    
    static func mapCheckout(checkoutPaymentCreate: CheckoutPaymentAddMutation.Data.CheckoutPaymentCreate?) -> Checkout {
        return Checkout(paymentId: checkoutPaymentCreate?.payment?.id ?? StringConstants.empty,
                        errors: checkoutPaymentCreate?.errors?.compactMap { error in error.message } ?? [])
    }
    
    static func mapCheckout(checkoutAddSavedCard: AddCheckoutPaymentSavedMutation.Data.CheckoutAddSavedCard?) -> Checkout {
        return Checkout(paymentId: checkoutAddSavedCard?.payment?.id ?? StringConstants.empty,
                        errors: checkoutAddSavedCard?.errors?.compactMap { error in error.message } ?? [])
    }
    
    static func mapCheckout(checkoutUpdateVoucher: DiscountCodeMutation.Data.CheckoutUpdateVoucher?) -> Checkout {
        return Checkout(id: checkoutUpdateVoucher?.checkout?.id ?? StringConstants.empty,
                        token: checkoutUpdateVoucher?.checkout?.token ?? StringConstants.empty,
                        quantity: String(checkoutUpdateVoucher?.checkout?.quantity ?? .zero),
                        errors: checkoutUpdateVoucher?.errors?.compactMap { error in error.message } ?? [])
    }
    
    static func mapCheckout(checkout: FetchCheckoutQueryQuery.Data.Checkout) -> Checkout {
        return Checkout(id: checkout.id,
                        token: checkout.token,
                        quantity: String(checkout.quantity),
                        subtotal: checkout.subtotalPrice?.gross.amount ?? DoubleConstants.defaultDouble,
                        shippingPrice: checkout.shippingPrice?.gross.amount.description ?? StringConstants.empty,
                        discountAmount: checkout.discountAmount?.amount.description ?? StringConstants.empty,
                        totalPrice: checkout.totalPrice?.gross.amount.description ?? StringConstants.empty,
                        owner: checkout.shippingAddress?.firstName ?? StringConstants.empty,
                        shippingAddress: checkout.shippingAddress?.asShippingAddress() ?? Address(),
                        shippingMethod: ShippingMethod(), deliveryDate: checkout.deliveryDate ?? StringConstants.empty)
    }
    
    static func mapCheckout(checkoutUpdateNote: CheckoutNoteAddMutation.Data.CheckoutUpdateNote?) -> Checkout {
        return Checkout(id: checkoutUpdateNote?.checkout?.id ?? StringConstants.empty,
                        token: checkoutUpdateNote?.checkout?.token ?? StringConstants.empty,
                        errors: checkoutUpdateNote?.errors?.compactMap { error in error.message } ?? [])
    }
    
    static func mapCheckout(checkoutComplete: CheckoutCompleteMutation.Data.CheckoutComplete?) -> CheckoutOrder {
        return CheckoutOrder(number: checkoutComplete?.order?.number ?? StringConstants.empty,
                             isPaid: checkoutComplete?.order?.isPaid ?? BoolConstants.defaultValue,
                             paymentStatus: checkoutComplete?.order?.paymentStatus?.rawValue ?? StringConstants.empty,
                             errors: checkoutComplete?.errors?.compactMap { error in error.message } ?? [])
    }
}

extension CheckoutLinesUpdateMutation.Data.CheckoutLinesUpdate.Checkout.Line {
    func asLine() -> CheckoutLine {
        return CheckoutLine(quantity: self.quantity,
                            totalPrice: self.totalPrice?.gross.amount ?? .zero,
                            checkoutVariant: self.variant.asVariant())
    }
}

extension CheckoutLinesUpdateMutation.Data.CheckoutLinesUpdate.Checkout.Line.Variant {
    func asVariant() -> CheckoutVariant {
        return CheckoutVariant(id: self.id,
                               productName: self.product.name,
                               productImageUrl: self.product.thumbnail?.url ?? StringConstants.empty,
                               name: self.name,
                               price: self.pricing?.price?.gross.amount ?? .zero,
                               weight: self.product.weight?.value ?? DoubleConstants.defaultDouble)
    }
}

extension CheckoutAddressUpdateMutation.Data.CheckoutShippingAddressUpdate.Checkout.ShippingAddress {
    func asShippingAddress() -> Address {
        return Address(id: self.id,
                       addressName: self.addressName ?? StringConstants.empty,
                       firstName: self.firstName,
                       lastName: self.lastName,
                       streetAddress1: self.streetAddress1,
                       streetAddress2: self.streetAddress2,
                       city: self.city,
                       cityArea: self.cityArea,
                       postalCode: self.postalCode,
                       country: self.country.country,
                       countryCode: self.country.code,
                       countryArea: self.countryArea,
                       phone: self.phone ?? StringConstants.empty,
                       isDefaultShippingAddress: self.isDefaultShippingAddress ?? BoolConstants.defaultValue,
                       isDefaultBillingAddress: self.isDefaultBillingAddress ?? BoolConstants.defaultValue)
    }
}

extension CheckoutAddressUpdateMutation.Data.CheckoutShippingAddressUpdate.Checkout.AvailableShippingMethod {
    func asShippingMethod() -> ShippingMethod {
        return ShippingMethod(id: self.id, price: self.price?.amount ?? .zero)
    }
}

extension FetchCheckoutQueryQuery.Data.Checkout.ShippingAddress {
    func asShippingAddress() -> Address {
        return Address(id: self.id,
                       addressName: self.addressName ?? StringConstants.empty,
                       firstName: self.firstName,
                       lastName: self.lastName,
                       streetAddress1: self.streetAddress1,
                       streetAddress2: self.streetAddress2,
                       city: self.city,
                       cityArea: self.cityArea,
                       postalCode: self.postalCode,
                       country: self.country.country,
                       countryCode: self.country.code,
                       countryArea: self.countryArea,
                       phone: self.phone ?? StringConstants.empty,
                       isDefaultShippingAddress: self.isDefaultShippingAddress ?? BoolConstants.defaultValue,
                       isDefaultBillingAddress: self.isDefaultBillingAddress ?? BoolConstants.defaultValue)
    }
}
