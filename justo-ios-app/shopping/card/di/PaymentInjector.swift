import Foundation

class PaymentInjector {
    
    fileprivate func provideApolloClientBuilder() -> ApolloClientBuilder {
        return Network.shared.apolloClientBuilder
    }
    
    fileprivate func provideCardRemoteDataSource() -> CardRemoteDataSource {
        return CardRemoteDataSource(apolloClientBuilder: provideApolloClientBuilder())
    }
    
    fileprivate func provideCardRepository() -> CardRepository {
        return CardRepository(cardRemoteDataSource: provideCardRemoteDataSource())
    }
    
    func provideGetCardsUseCase() -> GetCardsUseCase {
        return GetCardsUseCase(userRepository: UserInjector().provideUserRepository(), cardRepository: provideCardRepository())
    }
    
    fileprivate func provideCardPresenter(ui: CardUI) -> CardPresenter {
        let cardFormExceptionHandler = CardFormExceptionHandler()
        let cardPresenter = CardPresenter(createOpenPayPaymentUseCase: OpenPayInjector().provideCreateOpenPayPaymentUseCase(), cardFormExceptionHandler: cardFormExceptionHandler)
        cardPresenter.ui = ui
        return cardPresenter
    }
    
    func provideCardViewController() -> CardViewController {
        let cardViewController = CardViewController()
        cardViewController.presenter = provideCardPresenter(ui: cardViewController)
        return cardViewController
    }
}
