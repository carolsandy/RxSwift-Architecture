import Foundation
import UIKit
import RxSwift

class CheckoutDeliveryPresenter: Presenter {
    
    internal typealias UI = CheckoutDeliveryUI
    weak var ui: CheckoutDeliveryUI?
    
    private let getDeliveryDatesUseCase: GetDeliveryDatesUseCase
    private let updateShippingMethodUseCase: UpdateCheckoutShippingMethodUseCase
    
    private let disposeBag = DisposeBag()
    
    init(getDeliveryDatesUseCase: GetDeliveryDatesUseCase, updateShippingMethodUseCase: UpdateCheckoutShippingMethodUseCase) {
        self.getDeliveryDatesUseCase = getDeliveryDatesUseCase
        self.updateShippingMethodUseCase = updateShippingMethodUseCase
    }
    
    func getDeliveryDates(with postalCode: String) {
        guard let ui = ui else { return }
        ui.showLoader()
        getDeliveryDatesUseCase.fetchDeliveryDates(postalCode: postalCode)
            .subscribe(onNext: { dates in
            ui.hideLoader()
            if !dates.isEmpty {
                ui.showDeliveryDatesSuccess(dates: dates)
            }
        }, onError: { error in
            ui.hideLoader()
            ui.showDeliveryDatesError(message: error.localizedDescription)
        }).disposed(by: disposeBag)
    }
    
    func updateShippingMethod(shippingMethodId: String, deliveryDate: String) {
        guard let ui = ui else { return }
        ui.showLoader()
        updateShippingMethodUseCase.updateCheckoutShippingMethod(shippingMethodId: shippingMethodId, deliveryDate: deliveryDate)
            .subscribe(onNext: { checkout in
                ui.hideLoader()
                checkout.errors.isEmpty
                    ? ui.showUpdateShippingMethodSuccess(checkout: checkout)
                    : ui.showUpdateShippingMethodError(message: checkout.errors.first ?? StringConstants.empty)
            }, onError: { error in
                ui.hideLoader()
                ui.showUpdateShippingMethodError(message: "Network Error Title")
            }).disposed(by: disposeBag)
    }
}

protocol CheckoutDeliveryUI: LoadingUI {
    func showDeliveryDatesSuccess(dates: [DeliveryDay])
    func showDeliveryDatesError(message: String)
    func showUpdateShippingMethodSuccess(checkout: Checkout)
    func showUpdateShippingMethodError(message: String)
}
