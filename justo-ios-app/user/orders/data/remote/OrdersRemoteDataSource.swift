import Foundation
import RxSwift

class OrdersRemoteDataSource {
    
    private let ORDER_PAGE_SIZE = 30
    
    private let apolloClientBuilder: ApolloClientBuilder
    
    init(apolloClientBuilder: ApolloClientBuilder) {
        self.apolloClientBuilder = apolloClientBuilder
    }
    
    func fetchOrders(token: String) -> Observable<[Order]> {
        return apolloClientBuilder.createApolloClientWith(token: token).apolloRX.fetch(query: FetchOrdersQuery.init(first: ORDER_PAGE_SIZE))
            .compactMap { data in data.myOrders?.asOrders() }
    }

    func fetchOrder(token: String, id: String) -> Observable<OrderDetail> {
        return apolloClientBuilder.createApolloClientWith(token: token).apolloRX.fetch(query: FetchOrderQuery.init(id: id))
            .compactMap { data in data.order?.asOrderDetail() }
    }
}
