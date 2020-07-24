import Foundation
import RxSwift

class GetOrdersUseCase {

    private let userRepository: UserRepository
    private let ordersRepository: OrdersRepository

    init(userRepository: UserRepository, ordersRepository: OrdersRepository) {
        self.userRepository = userRepository
        self.ordersRepository = ordersRepository
    }
    
    func fetchOrders() -> Observable<[Order]> {
        return userRepository.getOrFetchUser().flatMap { user in self.ordersRepository.fetchOrders(token: user.token) }
    }
}
