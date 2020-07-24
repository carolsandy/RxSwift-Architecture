import Foundation
import Apollo
import CoreData

class SearchInjector {
    
    fileprivate func provideApolloClientBuilder() -> ApolloClientBuilder {
        return Network.shared.apolloClientBuilder
    }
    
    fileprivate func provideSearchRemoteSource() -> SearchRemoteDataSource {
        return SearchRemoteDataSource(apolloClientBuilder: provideApolloClientBuilder())
    }
    
    fileprivate func provideSearchRepository() -> SearchRepository {
        return SearchRepository(searchRemoteDataSource: provideSearchRemoteSource())
    }
    
    fileprivate func provideSearchUseCase() -> SearchUseCase {
        let categoriesRepository = CategoriesInjector().provideCategoriesRepository()
        let userRepository = UserInjector().provideUserRepository()
        return SearchUseCase(searchRepository: provideSearchRepository(), categoriesRepository: categoriesRepository, userRepository: userRepository)
    }
    
    fileprivate func provideSearchPresenter(searchUI: SearchUI) -> SearchPresenter {
        let searchPresenter = SearchPresenter(searchUseCase: provideSearchUseCase(), getUserUseCase: UserInjector().provideGetUserUseCase(), updateLineCheckoutUseCase: ShoppingInjector().provideUpdateLineCheckoutUseCase())
        searchPresenter.ui = searchUI
        return searchPresenter
    }
    
    func provideUISearchController(delegate: UIViewController) -> UISearchController {
        let searchResultsController = SuggestionsInjector().provideSuggestionsViewController(delegate: delegate)
        let searchController = UISearchController(searchResultsController: searchResultsController)
        searchController.searchResultsUpdater = searchResultsController
        searchController.searchBar.delegate = delegate as? UISearchBarDelegate
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.tintColor = .killarney
        searchController.searchBar.placeholder = .localizeString(for: "Search Placeholder")
        return searchController
    }
    
    fileprivate func provideSubcategoriesDataSource() -> UICollectionSubcategoriesDataSource {
        return UICollectionSubcategoriesDataSource()
    }
    
    fileprivate func provideProductsDataSource() -> UICollectionProductsDataSource {
        let productsDataSource = ProductsInjector().provideProductsDataSource()
        return productsDataSource
    }
    
    func provideSearchViewController(category: String = StringConstants.empty, query: String = StringConstants.empty) -> SearchViewController {
        let searchViewController = SearchViewController()
        searchViewController.presenter = provideSearchPresenter(searchUI: searchViewController)
        searchViewController.query = query
        searchViewController.category = category
        searchViewController.subcategoriesDataSource = provideSubcategoriesDataSource()
        searchViewController.productsDataSource = provideProductsDataSource()
        searchViewController.navigationItem.searchController = provideUISearchController(delegate: searchViewController)
        searchViewController.definesPresentationContext = true
        return searchViewController
    }
    
}
