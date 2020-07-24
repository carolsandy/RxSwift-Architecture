import Foundation

struct Order {
    var id: String
    var number: String
    var date: String
    var totalPrice: String
    var state: String
}

enum OrderState: String {
    case ready_to_fulfill
    case unfulfilled
    case partially_fulfilled
    case fulfilled
    case canceled
}

struct OrderDetail {
    var id: String
    var number: String
    var subTotal: String
    var shippingCost: String
    var discountCost: String
    var total: String
    var shippingAddressStreetAndNumber: String
    var shippingAddressExtra: String
    var city: String
    var shippingAddressMunicipality: String
    var suburb: String
    var phone: String
    var deliveryDate: String
    var paymentBrand: String
    var cardNumber: String
    var customerNote: String
    var productOrderLines:[OrderProductLine]
}

struct OrderProductLine {
    var id: String
    var image: String
    var name: String
    var quantity: String
    var price: String
}
