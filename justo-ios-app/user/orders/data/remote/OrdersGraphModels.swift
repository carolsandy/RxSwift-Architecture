import Foundation

extension FetchOrdersQuery.Data.MyOrder {
    
    func asOrders() -> [Order] {
        return self.edges.map { data in data.node.asOrder() }
    }
}

extension FetchOrdersQuery.Data.MyOrder.Edge.Node {
    
    func asOrder() -> Order {
        return Order(id: id,
                     number: number.orDefaultString(),
                     date: deliveryDate.orDefaultString(),
                     totalPrice: String(totalCaptured?.amount ?? DoubleConstants.defaultDouble),
                     state: status.rawValue)
    }
}

extension FetchOrderQuery.Data.Order {
    
    func asOrderDetail() -> OrderDetail {
        return OrderDetail(id: id,
                           number: number.orDefaultString(),
                           subTotal: String(subtotal?.gross.amount ?? DoubleConstants.defaultDouble),
                           shippingCost: String(shippingPrice?.gross.amount ?? DoubleConstants.defaultDouble),
                           discountCost: String(discountAmount?.amount ?? DoubleConstants.defaultDouble),
                           total: String(total?.gross.amount ?? DoubleConstants.defaultDouble),
                           shippingAddressStreetAndNumber: shippingAddress?.streetAddress1 ?? StringConstants.empty,
                           shippingAddressExtra: shippingAddress?.streetAddress2 ?? StringConstants.empty,
                           city: shippingAddress?.countryArea ?? StringConstants.empty,
                           shippingAddressMunicipality: shippingAddress?.city ?? StringConstants.empty,
                           suburb: shippingAddress?.cityArea ?? StringConstants.empty,
                           phone: shippingAddress?.phone ?? StringConstants.empty,
                           deliveryDate: deliveryDate.orDefaultString(),
                           paymentBrand: payments?.first??.creditCard?.brand ?? StringConstants.empty,
                           cardNumber: payments?.first??.creditCard?.lastDigits ?? StringConstants.empty,
                           customerNote: customerNote,
                           productOrderLines: lines.compactMap { line in line?.asOrderProductLine() })
    }
}

extension FetchOrderQuery.Data.Order.Line {
    
    func asOrderProductLine() -> OrderProductLine {
        return OrderProductLine(id: id,
                                image: thumbnail?.url ?? StringConstants.empty,
                                name: productName,
                                quantity: String(quantity),
                                price: String(total?.gross.amount ?? DoubleConstants.defaultDouble))
    }
}
