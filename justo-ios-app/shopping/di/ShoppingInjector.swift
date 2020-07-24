import Foundation
import Apollo
import UIKit
import CoreData

class ShoppingInjector {
    
    fileprivate func provideApolloClientBuilder() -> ApolloClientBuilder {
        return ApolloClientBuilder()
    }
    
    fileprivate func provideCheckoutRemoteDataSource() -> CheckoutRemoteDataSource {
        return CheckoutRemoteDataSource(apolloClientBuilder: provideApolloClientBuilder())
    }
    
    func provideCheckoutRepository() -> CheckoutRepository {
        return CheckoutRepository(checkoutRemoteDataSource: provideCheckoutRemoteDataSource())
    }
    
    func provideUpdateLineCheckoutUseCase() -> UpdateLineCheckoutUseCase {
        return UpdateLineCheckoutUseCase(userRepository: UserInjector().provideUserRepository(), checkoutRepository: provideCheckoutRepository())
    }
    
    fileprivate func provideClearCheckoutLinesUseCase() -> ClearCheckoutLinesUseCase {
        return ClearCheckoutLinesUseCase(userRepository: UserInjector().provideUserRepository(), checkoutRepository: provideCheckoutRepository())
    }
    
    fileprivate func provideUpdateCheckoutAddressUseCase() -> UpdateCheckoutAddressUseCase {
        return UpdateCheckoutAddressUseCase(userRepository: UserInjector().provideUserRepository(), checkoutRepository: provideCheckoutRepository())
    }
    
    fileprivate func provideUpdateCheckoutShippingMethodUseCase() -> UpdateCheckoutShippingMethodUseCase {
        return UpdateCheckoutShippingMethodUseCase(userRepository: UserInjector().provideUserRepository(), checkoutRepository: provideCheckoutRepository())
    }
    
    fileprivate func provideAddCheckoutPaymentUseCase() -> AddCheckoutPaymentUseCase {
        return AddCheckoutPaymentUseCase(userRepository: UserInjector().provideUserRepository(), openPayRepository: OpenPayInjector().provideOpenPayRepository(), checkoutRepository: provideCheckoutRepository())
    }
    
    fileprivate func provideApplyCheckoutDiscountCodeUseCase() -> ApplyCheckoutDiscountCodeUseCase {
        return ApplyCheckoutDiscountCodeUseCase(userRepository: UserInjector().provideUserRepository(), checkoutRepository: provideCheckoutRepository())
    }
    
    fileprivate func provideCompleteCheckoutUseCase() -> CompleteCheckoutUseCase {
        return CompleteCheckoutUseCase(userRepository: UserInjector().provideUserRepository(), checkoutRepository: provideCheckoutRepository())
    }
    
    fileprivate func provideGetCheckoutUseCase() -> GetCheckoutUseCase {
        return GetCheckoutUseCase(userRepository: UserInjector().provideUserRepository(), checkoutRepository: provideCheckoutRepository())
    }
    
    private func provideShoppingCartPresenter(ui: CartUI) -> CartPresenter {
        let cartPresenter = CartPresenter(getUserUseCase: UserInjector().provideGetUserUseCase(), updateLineCheckoutUseCase: provideUpdateLineCheckoutUseCase(), clearCheckoutLinesUseCase: provideClearCheckoutLinesUseCase(),
            analyticsUseCase: AnalyticsInjector().provideAnalyticsUseCase())
        cartPresenter.ui = ui
        return cartPresenter
    }
    
    fileprivate func provideCheckoutAddressFormPresenter(ui: CheckoutAddressFormUI) -> CheckoutAddressFormPresenter {
        let presenter = CheckoutAddressFormPresenter(addAddressUseCase: AddressInjector().provideAddAddressUseCase(), checkoutAddressFormHandler: CheckoutAddressFormHandler())
        presenter.ui = ui
        return presenter
    }
    
    fileprivate func provideCheckoutAddressPresenter(ui: CheckoutAddressUI) -> CheckoutAddressPresenter {
        let checkoutAddressPresenter = CheckoutAddressPresenter(getAddressUseCase: UserInjector().provideGetAddressUseCase(), updateAddressUseCase: provideUpdateCheckoutAddressUseCase())
        checkoutAddressPresenter.ui = ui
        return checkoutAddressPresenter
    }
    
    fileprivate func provideCheckoutPaymentPresenter(ui: CheckoutPaymentUI) -> CheckoutPaymentPresenter {
        let checkoutPaymentPresenter = CheckoutPaymentPresenter(getCardsUseCase: PaymentInjector().provideGetCardsUseCase(), addCheckoutPaymentUseCase: provideAddCheckoutPaymentUseCase())
        checkoutPaymentPresenter.ui = ui
        return checkoutPaymentPresenter
    }
    
    fileprivate func provideConfirmationOrderPresenter(ui: ConfirmationOrderUI) -> ConfirmationOrderPresenter {
        let confirmationOrderPresenter = ConfirmationOrderPresenter(getCheckoutUseCase: provideGetCheckoutUseCase(), completeCheckoutUseCase: provideCompleteCheckoutUseCase(),
            analyticsUseCase: AnalyticsInjector().provideAnalyticsUseCase())
        confirmationOrderPresenter.ui = ui
        return confirmationOrderPresenter
    }
    
    func provideCartViewController() -> CartViewController {
        let cartViewController = CartViewController()
        cartViewController.presenter = provideShoppingCartPresenter(ui: cartViewController)
        return cartViewController
    }
    
    func provideCheckoutViewController() -> UIViewController {
        let checkoutViewController = CheckoutViewController()
        let controllers = [provideCheckoutAddressViewController(),
                           DeliveryInjector().provideCheckoutDeliveryViewController(),
                           providePaymentMethodViewController()]
        checkoutViewController.controllers = controllers
        return checkoutViewController
    }

    func provideCheckoutAddressFormViewController() -> ShippingAddressViewController {
        let shippingAddressViewController = ShippingAddressViewController()
        shippingAddressViewController.presenter = provideCheckoutAddressFormPresenter(ui: shippingAddressViewController)
        return shippingAddressViewController
    }

    func provideCheckoutAddressViewController() -> CheckoutAddressViewController {
        let checkoutAddressViewController = CheckoutAddressViewController()
        checkoutAddressViewController.presenter = provideCheckoutAddressPresenter(ui: checkoutAddressViewController)
        return checkoutAddressViewController
    }
  
    func providePaymentMethodViewController() -> CheckoutPaymentViewController {
        let checkoutPaymentViewController = CheckoutPaymentViewController()
        checkoutPaymentViewController.presenter = provideCheckoutPaymentPresenter(ui: checkoutPaymentViewController)
        return checkoutPaymentViewController
    }
    
    func provideConfirmationOrderViewController(cardFormatted: String) -> ConfirmationOrderViewController {
        let confirmationOrderViewController = ConfirmationOrderViewController()
        confirmationOrderViewController.presenter = provideConfirmationOrderPresenter(ui: confirmationOrderViewController)
        confirmationOrderViewController.cardFormatted = cardFormatted
        return confirmationOrderViewController
    }
    
    func provideOrderStatusViewController(checkoutOrder: CheckoutOrder) -> OrderStatusViewController {
        let orderStatusViewController = OrderStatusViewController()
        orderStatusViewController.checkoutOrder = checkoutOrder
        return orderStatusViewController
    }
}
