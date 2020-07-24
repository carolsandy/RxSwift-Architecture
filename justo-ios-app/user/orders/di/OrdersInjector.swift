import Foundation

class OrdersInjector {
    
    fileprivate func provideApolloClientBuilder() -> ApolloClientBuilder {
        return ApolloClientBuilder()
    }
    
    fileprivate func provideOrdersRemoteDataSource() -> OrdersRemoteDataSource {
        return OrdersRemoteDataSource(apolloClientBuilder: provideApolloClientBuilder())
    }
    
    fileprivate func provideOrdersRepository() -> OrdersRepository {
        return OrdersRepository(ordersRemoteDataSource: provideOrdersRemoteDataSource())
    }
    
    func provideGetOrdersUseCase() -> GetOrdersUseCase {
        return GetOrdersUseCase(userRepository: UserInjector().provideUserRepository(), ordersRepository: provideOrdersRepository())
    }
    
    func provideGetOrderUseCase() -> GetOrderUseCase {
           return GetOrderUseCase(userRepository: UserInjector().provideUserRepository(), ordersRepository: provideOrdersRepository())
    }
    
    func provideAddOrderLinesToCheckoutUseCase() -> AddOrderLinesToCheckoutUseCase {
        return AddOrderLinesToCheckoutUseCase(checkoutRepository: ShoppingInjector().provideCheckoutRepository(), userRepository: UserInjector().provideUserRepository())
    }
    
    fileprivate func provideOrdersPresenter(ui: OrdersUI) -> OrdersPresenter {
        let ordersPresenter = OrdersPresenter(getUserUseCase: UserInjector().provideGetUserUseCase(),
            getOrdersUseCase: provideGetOrdersUseCase(), addOrderLinesToCheckoutUseCase: provideAddOrderLinesToCheckoutUseCase())
        ordersPresenter.ui = ui
        return ordersPresenter
    }
    
    fileprivate func provideOrderDetailPresenter(ui: OrderDetailUI) -> OrderDetailPresenter {
        let orderDetailPresenter = OrderDetailPresenter(getUserUseCase: UserInjector().provideGetUserUseCase(),
            getOrderUseCase: provideGetOrderUseCase(), addOrderLinesToCheckoutUseCase: provideAddOrderLinesToCheckoutUseCase())
        orderDetailPresenter.ui = ui
        return orderDetailPresenter
    }
    
    func provideOrdersViewController() -> OrdersViewController {
        let ordersViewController = OrdersViewController()
        ordersViewController.presenter = provideOrdersPresenter(ui: ordersViewController)
        return ordersViewController
    }
    
    func provideOrderDetailViewController(with orderId: String) -> OrderDetailViewController {
        let orderDetailViewController = OrderDetailViewController()
        orderDetailViewController.presenter = provideOrderDetailPresenter(ui: orderDetailViewController)
        orderDetailViewController.orderId = orderId
        return orderDetailViewController
    }
}
