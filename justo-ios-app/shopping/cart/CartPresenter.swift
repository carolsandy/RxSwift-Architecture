import Foundation
import RxSwift

class CartPresenter: Presenter {
    
    typealias UI = CartUI
    weak var ui: CartUI?
    
    private let getUserUseCase: GetUserUseCase
    private let updateLineCheckoutUseCase: UpdateLineCheckoutUseCase
    private let clearCheckoutLinesUseCase: ClearCheckoutLinesUseCase
    private let analyticsUseCase: AnalyticsUseCase

    private let disposeBag = DisposeBag()
    
    init(getUserUseCase: GetUserUseCase, updateLineCheckoutUseCase: UpdateLineCheckoutUseCase, clearCheckoutLinesUseCase: ClearCheckoutLinesUseCase,
         analyticsUseCase: AnalyticsUseCase) {
        self.getUserUseCase = getUserUseCase
        self.updateLineCheckoutUseCase = updateLineCheckoutUseCase
        self.clearCheckoutLinesUseCase = clearCheckoutLinesUseCase
        self.analyticsUseCase = analyticsUseCase
    }
    
    func fetchUser(isRefresh: Bool) {
        guard let ui = ui else { return }
        if !isRefresh { ui.showLoader() }
        getUserUseCase.getOrFetchUser(forceFetchUser: true).subscribe(onNext: { user in
            if !isRefresh { ui.hideLoader() }
            self.showCartOrEmpty(checkout: user.userCheckout, isClearLines: false)
        }, onError: { error in
            if !isRefresh { ui.hideLoader() }
        }).disposed(by: disposeBag)
    }
    
    func updateLineCheckout(checkoutLineUpdate: CheckoutLineUpdate) {
        guard let ui = ui else { return }
        updateLineCheckoutUseCase.updateCheckoutLine(checkoutLineUpdate: checkoutLineUpdate).subscribe(onNext: { checkout in
            self.showCartOrEmpty(checkout: checkout, isClearLines: false)
        }, onError: { error in
            ui.showError()
        }).disposed(by: disposeBag)
    }
    
    func clearLines() {
        guard let ui = ui else { return }
        ui.showLoader()
        clearCheckoutLinesUseCase.clearCheckoutLines().subscribe(onNext: { checkout in
            ui.hideLoader()
            self.showCartOrEmpty(checkout: checkout, isClearLines: true)
        }, onError: { error in
            ui.hideLoader()
            ui.showError()
        }).disposed(by: disposeBag)
    }
    
    private func showCartOrEmpty(checkout: Checkout, isClearLines: Bool) {
        guard let ui = ui else { return }
        if checkout.checkoutLines.count != ShoppingConstants.emptyCart && checkout.errors.isEmpty {
            ui.updateCart(with: checkout)
            trackEvent(AnalyticsEvents.SHOPPING_CART_VIEW)
        } else {
            !checkout.errors.isEmpty ? ui.showError() : ui.showEmptyCart(notifyItemsDeleted: isClearLines)
        }
    }

    func openCheckoutViewController() {
        guard let ui = ui else { return }
        trackEvent(AnalyticsEvents.CHECKOUT_STARTED_EVENT)
        ui.showCheckoutViewController()
    }

    private func trackEvent(_ eventName: String) {
        analyticsUseCase.trackEvent(eventName: eventName)
            .subscribe()
            .disposed(by: disposeBag)
    }
}

protocol CartUI: LoadingUI {
    func updateCart(with checkout: Checkout)
    func showEmptyCart(notifyItemsDeleted: Bool)
    func showError()
    func showCheckoutViewController()
}
