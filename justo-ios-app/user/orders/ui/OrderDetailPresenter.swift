import Foundation
import UIKit
import RxSwift

class OrderDetailPresenter: Presenter {
    
    internal typealias UI = OrderDetailUI
    weak var ui: OrderDetailUI?
    
    private let disposeBag = DisposeBag()

    private let getUserUseCase: GetUserUseCase
    private let getOrderUseCase: GetOrderUseCase
    private let addOrderLinesToCheckoutUseCase: AddOrderLinesToCheckoutUseCase
    
    init(getUserUseCase: GetUserUseCase, getOrderUseCase: GetOrderUseCase, addOrderLinesToCheckoutUseCase: AddOrderLinesToCheckoutUseCase) {
        self.getUserUseCase = getUserUseCase
        self.getOrderUseCase = getOrderUseCase
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

    func getOrder(with id: String) {
        guard let ui = ui else { return }
        ui.showLoader()
        getOrderUseCase.fetchOrder(id: id)
            .subscribe(onNext: { orderDetail in
                ui.hideLoader()
                ui.showOrderSuccess(with: orderDetail)
            }, onError: { error in
                ui.hideLoader()
                ui.showOrderError(message: error.localizedDescription)
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

protocol OrderDetailUI: LoadingUI {
    func showOrderSuccess(with order: OrderDetail)
    func showOrderError(message: String)
    func showCartUpdatedError()
    func showCartUpdated()
    func updateBadge(quantity: Int)
}
