import UIKit
import RxSwift

class OrdersPresenter: Presenter {
    
    internal typealias UI = OrdersUI
    weak var ui: OrdersUI?

    private let getUserUseCase: GetUserUseCase
    private let getOrdersUseCase: GetOrdersUseCase
    private let addOrderLinesToCheckoutUseCase: AddOrderLinesToCheckoutUseCase

    private let disposeBag = DisposeBag()
    
    init(getUserUseCase: GetUserUseCase, getOrdersUseCase: GetOrdersUseCase, addOrderLinesToCheckoutUseCase: AddOrderLinesToCheckoutUseCase) {
        self.getUserUseCase = getUserUseCase
        self.getOrdersUseCase = getOrdersUseCase
        self.addOrderLinesToCheckoutUseCase = addOrderLinesToCheckoutUseCase
    }

    func getOrFetchUser() {
        guard let ui = ui else { return }
        getUserUseCase.getOrFetchUser(forceFetchUser: true)
            .subscribe(onNext: { user in
                ui.updateBadge(quantity: user.userCheckout.quantity)
            }, onError: { error in
                print(error.localizedDescription)
            }).disposed(by: disposeBag)
    }

    func getOrders() {
        guard let ui = ui else { return }
        ui.showLoader()
        getOrdersUseCase.fetchOrders()
            .subscribe(onNext: { orders in
            ui.hideLoader()
            if !orders.isEmpty {
                ui.showOrdersSuccess(orders: orders)
            } else {
                ui.showEmptyOrders()
            }
        }, onError: { error in
            ui.hideLoader()
            ui.showOrdersError(message: error.localizedDescription)
        }).disposed(by: disposeBag)
    }
    
    func addOrderToCheckout(orderId: String) {
        guard let ui = ui else { return }
        ui.showLoader()
        addOrderLinesToCheckoutUseCase.addOrderLinesToCheckout(orderId: orderId).subscribe(onNext: { checkout in
            ui.hideLoader()
            ui.updateBadge(quantity: checkout.quantity)
            ui.showCartUpdated()
        }, onError: { error in
            ui.hideLoader()
            ui.showCartUpdatedError()
        }).disposed(by: disposeBag)
    }
}

protocol OrdersUI: LoadingUI {
    func showOrdersSuccess(orders: [Order])
    func showEmptyOrders()
    func showCartUpdatedError()
    func showCartUpdated()
    func updateBadge(quantity: Int)
    func showOrdersError(message: String)
}
