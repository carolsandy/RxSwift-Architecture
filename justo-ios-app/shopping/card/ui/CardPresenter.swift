import Foundation
import UIKit
import RxSwift

class CardPresenter: Presenter {
    
    typealias UI = CardUI
    weak var ui: CardUI?
    
    private let createOpenPayPaymentUseCase: CreateOpenPayPaymentUseCase
    private let cardFormExceptionHandler: CardFormExceptionHandler
    private let disposeBag = DisposeBag()
    
    init(createOpenPayPaymentUseCase: CreateOpenPayPaymentUseCase, cardFormExceptionHandler: CardFormExceptionHandler) {
        self.createOpenPayPaymentUseCase = createOpenPayPaymentUseCase
        self.cardFormExceptionHandler = cardFormExceptionHandler
    }
    
    func addCard(card: Card) {
        guard let ui = ui else { return }
        ui.resetForm()
        let isValidCard = cardFormExceptionHandler.isValidCard(card: card)
        guard !isValidCard.error else { ui.showAddCardError(errorType: isValidCard.message); return }
        ui.showLoader()
        createOpenPayPaymentUseCase.createOpenPayPayment(card: card)
            .subscribe(onNext: { payment in payment.shouldSave = card.shouldSave
                ui.hideLoader()
                ui.showAddCardSuccess(openPayPayment: payment)
        }, onError: { error in
            let errorCode = (error as NSError).code
            if errorCode == CardFormExceptionHandler.invalidCardErrorCode {
                ui.showAddCardError(errorType: CardError.number(.localizeString(for: "Card Number Error")))
            } else if errorCode == CardFormExceptionHandler.openPayErrorCode {
                ui.showAddCardError(errorType: CardError.openPay(.localizeString(for: "Card Creation Error")))
            } else {
                ui.showAddCardError(errorType: error)
            }
        }).disposed(by: disposeBag)
    }
}

protocol CardUI: LoadingUI {
    func showAddCardSuccess(openPayPayment: OpenPayPayment)
    func showAddCardError(errorType: Error)
    func resetForm()
}
