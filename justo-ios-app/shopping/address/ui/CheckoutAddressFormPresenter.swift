import Foundation
import UIKit
import RxSwift

class CheckoutAddressFormPresenter: Presenter {
    
    internal typealias UI = CheckoutAddressFormUI
    weak var ui: CheckoutAddressFormUI?
    let checkoutAddressFormHandler: CheckoutAddressFormHandler
    
    let addAddressUseCase: AddAddressUseCase
    
    private let disposeBag = DisposeBag()
    
    init(addAddressUseCase: AddAddressUseCase, checkoutAddressFormHandler: CheckoutAddressFormHandler) {
        self.addAddressUseCase = addAddressUseCase
        self.checkoutAddressFormHandler = checkoutAddressFormHandler
    }
    
    func addAddress(addressAddInput: AddressAddInput) {
        guard let ui = ui else { return }
        ui.resetForm()
        
        let isValidAddres = checkoutAddressFormHandler.isValidAddress(addressAddInput: addressAddInput)
        guard !isValidAddres.error else {
            ui.showAddAddressError(isValidAddres.message); return
        }
        
        ui.showLoader()
        addAddressUseCase.addAddress(addressAddInput: addressAddInput)
            .subscribe(onNext: { errors in
                ui.hideLoader()
                if !errors.isEmpty {
                    ui.showAddAddressError(AddressFormError.graphQL(errors.first.orDefaultString()))
                } else {
                    ui.showAddAddressesSuccess()
                }
            }, onError: { error in
                ui.hideLoader()
                ui.showAddAddressError(error)
            }).disposed(by: disposeBag)
    }
}

protocol CheckoutAddressFormUI: LoadingUI {
    
    func showAddAddressesSuccess()
    
    func showAddAddressError(_ errorType: Error)
    
    func resetForm()
}
