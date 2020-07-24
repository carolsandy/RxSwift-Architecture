import Foundation
import Apollo

class DeliveryInjector {
    
    fileprivate func provideApolloClient() -> ApolloClient {
        return Network.shared.apolloClient
    }
    
    fileprivate func provideDeliveryRemoteDataSource() -> DeliveryRemoteDataSource {
        return DeliveryRemoteDataSource(apolloClient: provideApolloClient())
    }
    
    fileprivate func provideDeliveryRepository() -> DeliveryRepository {
        return DeliveryRepository(deliveryRemoteDataSource: provideDeliveryRemoteDataSource())
    }
    
    fileprivate func provideGetDeliveryDatesUseCase() -> GetDeliveryDatesUseCase {
        return GetDeliveryDatesUseCase(userRepository: UserInjector().provideUserRepository(), deliveryRepository: provideDeliveryRepository())
    }
    
    fileprivate func provideUpdateShippingMethodUseCase() -> UpdateCheckoutShippingMethodUseCase {
        return UpdateCheckoutShippingMethodUseCase(userRepository: UserInjector().provideUserRepository(), checkoutRepository: ShoppingInjector().provideCheckoutRepository())
    }
    
    fileprivate func provideDeliveryDatesPresenter(ui: CheckoutDeliveryUI) -> CheckoutDeliveryPresenter {
        let checkoutDeliveryPresenter = CheckoutDeliveryPresenter(getDeliveryDatesUseCase: provideGetDeliveryDatesUseCase(), updateShippingMethodUseCase: provideUpdateShippingMethodUseCase())
        checkoutDeliveryPresenter.ui = ui
        return checkoutDeliveryPresenter
    }
    
    func provideCheckoutDeliveryViewController() -> CheckoutDeliveryViewController {
        let checkoutDeliveryViewController = CheckoutDeliveryViewController()
        let deliveryDayDataSource = DeliveryDayCollectionDataSource()
        let deliveryHourDataSource = DeliveryHourCollectionDataSource()
        checkoutDeliveryViewController.deliveryDayDataSource = deliveryDayDataSource
        checkoutDeliveryViewController.deliveryHourDataSource = deliveryHourDataSource
        checkoutDeliveryViewController.presenter = provideDeliveryDatesPresenter(ui: checkoutDeliveryViewController)
        return checkoutDeliveryViewController
    }
 }
