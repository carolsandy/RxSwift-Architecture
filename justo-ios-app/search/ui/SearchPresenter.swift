import Foundation
import UIKit
import RxSwift

class SearchPresenter: Presenter {
    
    internal typealias UI = SearchUI
    weak var ui: SearchUI?
    
    let searchUseCase: SearchUseCase
    let getUserUseCase: GetUserUseCase
    let updateLineCheckoutUseCase: UpdateLineCheckoutUseCase

    private let disposeBag = DisposeBag()
    
    init(searchUseCase: SearchUseCase, getUserUseCase: GetUserUseCase, updateLineCheckoutUseCase: UpdateLineCheckoutUseCase) {
        self.searchUseCase = searchUseCase
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

    func search(searchRequest: SearchRequest, isRefresh: Bool) {
        guard let ui = ui else { return }
        if !isRefresh { ui.showLoader() }
        searchUseCase.search(searchRequest: searchRequest)
            .subscribe(onNext: { searchResult in
                if !isRefresh { ui.hideLoader() }
                if searchResult.productInfo.products.isEmpty {
                    ui.showEmptySearch()
                } else {
                    ui.showSearchSuccess(searchResult: searchResult, shouldRefresh: isRefresh)
                }
            }, onError: { error in
                if !isRefresh { ui.hideLoader() }
                ui.showSearchError(message: error.localizedDescription)
            }).disposed(by: disposeBag)
    }
    
    func updateProductsByCategory(searchRequest: SearchRequest) {
        guard let ui = ui else { return }
        ui.showLoader()
        searchUseCase.search(searchRequest: searchRequest)
            .subscribe(onNext: { searchResult in
                ui.hideLoader()
                ui.updateProductsSuccess(searchResult: searchResult)
            }, onError: { error in
                ui.hideLoader()
                ui.updateProductsError(message: error.localizedDescription)
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

    func loadMore(searchRequest: SearchRequest) {
        guard let ui = ui else { return }
        ui.showLoader()
        searchUseCase.search(searchRequest: searchRequest)
            .subscribe(onNext: { searchResult in
                ui.hideLoader()
                ui.loadMoreSuccess(searchResult: searchResult)
            }, onError: { error in
                ui.hideLoader()
                ui.loadMoreError(message: error.localizedDescription)
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

protocol SearchUI: LoadingUI, CartEditionUI {

    func updateCartBadge(quantity: Int)
    func showSearchSuccess(searchResult: SearchResult, shouldRefresh: Bool)
    func showSearchError(message: String)
    func updateProductsSuccess(searchResult: SearchResult)
    func updateProductsError(message: String)
    func loadMoreSuccess(searchResult: SearchResult)
    func loadMoreError(message: String)
    func showCartViewController()
    func showSignInViewController(hasNextController: Bool)
    func showEmptySearch()
    func showUpdateProductError()
}
