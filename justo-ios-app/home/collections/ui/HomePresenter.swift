import Foundation
import RxSwift

class HomePresenter: Presenter {
    
    typealias UI = HomeUI
    weak var ui: HomeUI?
    
    let getCollectionsUseCase: GetCollectionsUseCase
    let getUserUseCase: GetUserUseCase
    let updateLineCheckoutUseCase: UpdateLineCheckoutUseCase

    private let disposeBag = DisposeBag()
    
    init(collectionUseCase: GetCollectionsUseCase, getUserUseCase: GetUserUseCase, updateLineCheckoutUseCase: UpdateLineCheckoutUseCase) {
        self.getCollectionsUseCase = collectionUseCase
        self.getUserUseCase = getUserUseCase
        self.updateLineCheckoutUseCase = updateLineCheckoutUseCase
    }

    func getOrFetchUser(forceFetchUser: Bool = false) {
        guard let ui = ui else { return }
        getUserUseCase.getOrFetchUser(forceFetchUser: forceFetchUser)
            .subscribe(onNext: { user in
                ui.updateBadge(quantity: user.userCheckout.quantity)
            }, onError: { error in
                print(error.localizedDescription)
            }).disposed(by: disposeBag)
    }
    
    func fetchCollections(isRefresh: Bool) {
        guard let ui = ui else { return }
        if !isRefresh { ui.showLoader() }
        getCollectionsUseCase.getCollections()
            .subscribe(onNext: { response in
                if !isRefresh { ui.hideLoader() }
                if !response.isEmpty {
                    ui.showCollectionsSuccess(collections: response, shouldRefresh: isRefresh)
                } else {
                    ui.showCollectionsError(message: "Collections empty")
                }
            }, onError: { error in
                if !isRefresh { ui.hideLoader() }
                ui.showNetworkError()
            }).disposed(by: disposeBag)
    }

    func openProfileViewController() {
        guard let ui = ui else { return }
        getUserUseCase.getOrFetchUser()
            .subscribe(onNext: { user in
                ui.showProfileViewController()
            }, onError: { error in
                switch error {
                case SessionError.authentication:
                    ui.showSignInViewController(hasNextController: false)
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

protocol HomeUI: LoadingUI, CartEditionUI {
    func updateBadge(quantity: Int)
    func showCollectionsSuccess(collections: [HomeCollection], shouldRefresh: Bool)
    func showCollectionsError(message: String)
    func showNetworkError()
    func showProfileViewController()
    func showSignInViewController(hasNextController: Bool)
    func showUpdateProductError()
}
