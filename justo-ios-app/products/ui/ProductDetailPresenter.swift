import Foundation
import RxSwift

class ProductDetailPresenter: Presenter {

    internal typealias UI = ProductDetailUI
    weak var ui: ProductDetailUI?

    private let getProductUseCase: GetProductUseCase
    private let getUserUseCase: GetUserUseCase
    private let updateLineCheckoutUseCase: UpdateLineCheckoutUseCase

    private let disposeBag = DisposeBag()

    init(getProductUseCase: GetProductUseCase, getUserUseCase: GetUserUseCase, updateLineCheckoutUseCase: UpdateLineCheckoutUseCase) {
        self.getProductUseCase = getProductUseCase
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

    func getProduct(id: String) {
        guard let ui = ui else { return }
        ui.showLoader()
        getProductUseCase.fetchProduct(id: id)
            .subscribe(onNext: { currentProduct in
                ui.hideLoader()
                ui.showProductSuccess(product: currentProduct)
            }, onError: { error in
                ui.hideLoader()
                ui.showProductError(message: error.localizedDescription)
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
                ui.showCheckoutUpdate(quantity: checkout.quantity)
            }, onError: { error in
                switch error {
                case SessionError.authentication:
                    ui.showSignInViewController(hasNextController: false)
                default:
                    ui.showCheckoutUpdateError()
                }
            }).disposed(by: disposeBag)
    }
}

protocol ProductDetailUI: LoadingUI {

    func updateBadge(quantity: Int)
    func showProductSuccess(product: Product)
    func showProductError(message: String)
    func showCartViewController()
    func showCheckoutUpdate(quantity: Int)
    func showCheckoutUpdateError()
    func showSignInViewController(hasNextController: Bool)
}
