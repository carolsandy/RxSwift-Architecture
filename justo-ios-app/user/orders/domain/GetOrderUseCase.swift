import Foundation
import RxSwift

class GetOrderUseCase {

    private let userRepository: UserRepository
    private let ordersRepository: OrdersRepository

    init(userRepository: UserRepository, ordersRepository: OrdersRepository) {
        self.userRepository = userRepository
        self.ordersRepository = ordersRepository
    }
    
    func fetchOrder(id: String) -> Observable<OrderDetail> {
        return userRepository.getOrFetchUser().flatMap { user in self.ordersRepository.fetchOrder(token: user.token, id: id) }
    }
}
