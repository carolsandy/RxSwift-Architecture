import Foundation
import RxSwift

class ConfirmationOrderPresenter: Presenter {
    
    typealias UI = ConfirmationOrderUI
    weak var ui: ConfirmationOrderUI?
    
    private let getCheckoutUseCase: GetCheckoutUseCase
    private let completeCheckoutUseCase: CompleteCheckoutUseCase
    private let analyticsUseCase: AnalyticsUseCase
    
    private let disposeBag = DisposeBag()
    
    init(getCheckoutUseCase: GetCheckoutUseCase, completeCheckoutUseCase: CompleteCheckoutUseCase, analyticsUseCase: AnalyticsUseCase) {
        self.getCheckoutUseCase = getCheckoutUseCase
        self.completeCheckoutUseCase = completeCheckoutUseCase
        self.analyticsUseCase = analyticsUseCase
    }
    
    func fetchCheckout() {
        guard let ui = ui else { return }
        ui.showLoader()
        getCheckoutUseCase.fetchCheckout().subscribe(onNext: { checkout in
            ui.hideLoader()
            checkout.errors.isEmpty
                ? ui.showOrderConfirmationSuccess(with: checkout)
                : ui.showOrderConfirmationError(message: checkout.errors.first.orDefaultString())
        }, onError: { error in
            ui.hideLoader()
            ui.showOrderConfirmationError(message: error.localizedDescription)
        }).disposed(by: disposeBag)
    }

    func completeCheckout(note: String) {
        guard let ui = ui else { return }
        ui.showLoader()
        completeCheckoutUseCase.completeCheckout(note: note)
            .subscribe(onNext: { checkoutOrder in
                ui.hideLoader()
                ui.showCompleteCheckoutSuccess(checkoutOrder: checkoutOrder)
                if checkoutOrder.isPaid {
                    self.trackEvent()
                }
            }, onError: { error in
                ui.hideLoader()
                ui.showCompleteCheckoutError(message: error.localizedDescription)
            }).disposed(by: disposeBag)
    }

    private func trackEvent() {
        analyticsUseCase.trackEvent(eventName: AnalyticsEvents.ORDER_COMPLETE_EVENT)
            .subscribe()
            .disposed(by: disposeBag)
    }
}

protocol ConfirmationOrderUI: LoadingUI {
    func showOrderConfirmationSuccess(with checkout: Checkout)
    func showOrderConfirmationError(message: String)
    func showCompleteCheckoutSuccess(checkoutOrder: CheckoutOrder)
    func showCompleteCheckoutError(message: String)
}
