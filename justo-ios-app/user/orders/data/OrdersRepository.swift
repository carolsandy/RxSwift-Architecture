import Foundation
import RxSwift

class OrdersRepository {
    
    private let ordersRemoteDataSource: OrdersRemoteDataSource
    
    init(ordersRemoteDataSource: OrdersRemoteDataSource) {
        self.ordersRemoteDataSource = ordersRemoteDataSource
    }
    
    func fetchOrders(token: String) -> Observable<[Order]> {
        return ordersRemoteDataSource.fetchOrders(token: token)
    }
    
    func fetchOrder(token: String, id: String) -> Observable<OrderDetail> {
        return ordersRemoteDataSource.fetchOrder(token: token, id: id)
    }
}
