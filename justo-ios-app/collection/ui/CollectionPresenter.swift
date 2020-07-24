import Foundation
import UIKit
import RxSwift

class CollectionPresenter: Presenter {
    
    internal typealias UI = CollectionUI
    weak var ui: CollectionUI?
    
    let getCollectionUseCase: GetCollectionUseCase
    let getUserUseCase: GetUserUseCase
    let updateLineCheckoutUseCase: UpdateLineCheckoutUseCase

    private let disposeBag = DisposeBag()
    
    init(getCollectionUseCase: GetCollectionUseCase, getUserUseCase: GetUserUseCase, updateLineCheckoutUseCase: UpdateLineCheckoutUseCase) {
        self.getCollectionUseCase = getCollectionUseCase
        self.getUserUseCase = getUserUseCase
        self.updateLineCheckoutUseCase = updateLineCheckoutUseCase
    }

    func getOrFetchUser(forceFetchUser: Bool = false) {
        guard let ui = ui else { return }
        getUserUseCase.getOrFetchUser(forceFetchUser: forceFetchUser)
            .subscribe(onNext: { user in
                ui.updateCartBadge(quantity: user.userCheckout.quantity)
            }, onError: { error in
                print(error.localizedDescription)
            }).disposed(by: disposeBag)
    }
    
    func getCollection(by id: String, isRefresh: Bool) {
        guard let ui = ui else { return }
        ui.showLoader()
        getCollectionUseCase.fetchCollectionBy(id: id).subscribe(onNext: { collection in
            ui.hideLoader()
            ui.showCollectionSuccess(collection: collection, shouldRefresh: isRefresh)
        }, onError: { error in
            ui.hideLoader()
            ui.showCollectionError()
        }).disposed(by: disposeBag)
    }

    func openCartViewController() {
        guard let ui = ui else { return }
        getUserUseCase.getOrFetchUser()
            .subscribe(onNext: { user in
                ui.showCartViewController()
            }, onError: { error in
                switch error {
                case SessionError.authentication:
                    ui.showSignInViewController(hasNextController: true)
                default:
                    print(error.localizedDescription)
                }
            }).disposed(by: disposeBag)
    }

    func updateCheckoutLine(checkoutLineUpdate: CheckoutLineUpdate) {
        guard let ui = ui else { return }
        updateLineCheckoutUseCase.updateCheckoutLine(checkoutLineUpdate: checkoutLineUpdate)
            .subscribe(onNext: { checkout in
                ui.updateCartBadge(quantity: checkout.quantity)
            }, onError: { error in
                switch error {
                case SessionError.authentication:
                    ui.showSignInViewController(hasNextController: false)
                default:
                    ui.showUpdateProductError()
                }
            }).disposed(by: disposeBag)
    }
}

protocol CollectionUI: LoadingUI, CartEditionUI {

    func updateCartBadge(quantity: Int)
    func showCollectionSuccess(collection: Collection, shouldRefresh: Bool)
    func showCollectionError()
    func showCartViewController()
    func showSignInViewController(hasNextController: Bool)
}
