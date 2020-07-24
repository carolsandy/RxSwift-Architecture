import Foundation
import UIKit
import RxSwift

class CheckoutPaymentPresenter: Presenter {
    
    typealias UI = CheckoutPaymentUI
    weak var ui: CheckoutPaymentUI?
    
    private let getCardsUseCase: GetCardsUseCase
    private let addCheckoutPaymentUseCase: AddCheckoutPaymentUseCase
    private let disposeBag = DisposeBag()
    
    init(getCardsUseCase: GetCardsUseCase, addCheckoutPaymentUseCase: AddCheckoutPaymentUseCase) {
        self.getCardsUseCase = getCardsUseCase
        self.addCheckoutPaymentUseCase = addCheckoutPaymentUseCase
    }
    
    func getCards() {
        guard let ui = ui else { return }
        ui.showLoader()
        getCardsUseCase.getCards()
            .subscribe(onNext: { cards in
                ui.hideLoader()
                ui.showCardsSuccess(cards: cards)
            }, onError: { error in
                ui.hideLoader()
                ui.showCardsError(message: error.localizedDescription)
            }).disposed(by: disposeBag)
    }
    
    func updatePayment(updateCheckoutPaymentInput: UpdateCheckoutPaymentInput, isSaved: Bool = false) {
        guard let ui = ui else { return }
        ui.showLoader()
        addCheckoutPaymentUseCase.addCheckoutPayment(updateCheckoutPaymentInput: updateCheckoutPaymentInput, isSaved: isSaved)
            .subscribe(onNext: { checkout in
                ui.hideLoader()
                checkout.errors.isEmpty
                    ? ui.showAddPaymentSuccess(checkout: checkout)
                    : ui.showAddPaymentError(message: checkout.errors.first.orDefaultString())
            }, onError: { error in
                ui.hideLoader()
                ui.showAddPaymentError(message: "Update shopping Cart Error")
            }).disposed(by: disposeBag)
    }
}

protocol CheckoutPaymentUI: LoadingUI {
    func showCardsSuccess(cards: [SavedCard])
    func showCardsError(message: String)
    func showAddPaymentSuccess(checkout: Checkout)
    func showAddPaymentError(message: String)
}
