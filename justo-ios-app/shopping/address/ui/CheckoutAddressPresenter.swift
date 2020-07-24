import Foundation
import UIKit
import RxSwift

class CheckoutAddressPresenter {
    
    internal typealias UI = CheckoutAddressUI
    weak var ui: CheckoutAddressUI?
    
    private let getAddressUseCase: GetAddressUseCase
    private let updateAddressUseCase: UpdateCheckoutAddressUseCase
    
    private let disposeBag = DisposeBag()
    
    init(getAddressUseCase: GetAddressUseCase, updateAddressUseCase: UpdateCheckoutAddressUseCase) {
        self.getAddressUseCase = getAddressUseCase
        self.updateAddressUseCase = updateAddressUseCase
    }
    
    func getAddresses() {
        guard let ui = ui else { return }
        ui.showLoader()
        getAddressUseCase.getAddresses()
            .subscribe(onNext: { addresses in
                ui.hideLoader()
                if !addresses.isEmpty { ui.showAddressesSuccess(addresses: addresses)}
            }, onError: { error in
                ui.hideLoader()
                ui.showAddressesError(message: error.localizedDescription)
            }).disposed(by: disposeBag)
    }
    
    func updateAddress(with shippingAddressId: String) {
        guard let ui = ui else { return }
        ui.showLoader()
        updateAddressUseCase.updateCheckoutAddress(with: shippingAddressId)
            .subscribe(onNext: { checkout in
                ui.hideLoader()
                checkout.errors.isEmpty ? ui.showUpdateAddressSuccess(checkout: checkout) : ui.showUpdateAddressError(message: checkout.errors.first.orDefaultString())
            }, onError: { error in
                ui.hideLoader()
                ui.showUpdateAddressError(message: error.localizedDescription)
            }).disposed(by: disposeBag)
    }
}

protocol CheckoutAddressUI: LoadingUI {
    func showAddressesSuccess(addresses: [Address])
    func showAddressesError(message: String)
    func showUpdateAddressSuccess(checkout: Checkout)
    func showUpdateAddressError(message: String)
}
