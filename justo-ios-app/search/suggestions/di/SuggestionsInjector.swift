import Foundation
import Apollo

class SuggestionsInjector {
    
    fileprivate func provideApolloClient() -> ApolloClient {
        return Network.shared.apolloClient
    }
    
    fileprivate func provideSuggestionsRemoteSource() -> SuggestionsRemoteDataSource {
        return SuggestionsRemoteDataSource(apolloClient: provideApolloClient())
    }
    
    fileprivate func provideSuggestionsRepository() -> SuggestionsRepository {
        return SuggestionsRepository(suggestionsRemoteDataSource: provideSuggestionsRemoteSource())
    }
    
    fileprivate func provideSuggestionsUseCase() -> SuggestionsUseCase {
        return SuggestionsUseCase(suggestionsRepository: provideSuggestionsRepository())
    }
    
    fileprivate func provideSuggestionsPresenter(suggestionsUI: SuggestionsUI) -> SuggestionsPresenter {
        let suggestionsPresenter = SuggestionsPresenter(suggestionsUseCase: provideSuggestionsUseCase())
        suggestionsPresenter.ui = suggestionsUI
        return suggestionsPresenter
    }
    
    func provideSuggestionsViewController(delegate: UIViewController) -> SuggestionsViewController {
        let suggestionsViewController = SuggestionsViewController()
        suggestionsViewController.presenter = provideSuggestionsPresenter(suggestionsUI: suggestionsViewController)
        suggestionsViewController.suggestionsDelegate = delegate as? SuggestionsDelegate
        return suggestionsViewController
    }
    
}
