import Foundation
import Apollo
import CoreData

class CategoriesInjector {
    
    fileprivate func provideApolloClient() -> ApolloClient {
        return Network.shared.apolloClient
    }
    
    fileprivate func provideManagedContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        return appDelegate?.persistentContainer.viewContext ?? NSManagedObjectContext.init(concurrencyType: .mainQueueConcurrencyType)
    }
    
    fileprivate func provideCategoriesRemoteDataSource() -> CategoriesRemoteDataSource {
        return CategoriesRemoteDataSource(apolloClient: provideApolloClient())
    }
    
    fileprivate func provideCategoriesLocalDataSource() -> CategoriesLocalDataSource {
        return CategoriesLocalDataSource(managedContext: provideManagedContext())
    }
    
    func provideCategoriesRepository() -> CategoriesRepository {
        return CategoriesRepository(categoriesLocalDataSource: provideCategoriesLocalDataSource(),
                                    categoriesRemoteDataSource: provideCategoriesRemoteDataSource())
    }
    
    func provideGetCategoriesUseCase() -> GetCategoriesUseCase {
        return GetCategoriesUseCase(categoriesRepository: provideCategoriesRepository())
    }
    
    func provideCategoriesPresenter(categoriesUI: CategoriesUI) -> CategoriesPresenter {
        return CategoriesPresenter(categoriesUI: categoriesUI, categoriesUseCase: provideGetCategoriesUseCase())
    }
    
    func provideCategoriesViewController() -> CategoriesViewController {
        let categoriesViewController = CategoriesViewController()
        categoriesViewController.presenter = provideCategoriesPresenter(categoriesUI: categoriesViewController)
        categoriesViewController.navigationItem.searchController = SearchInjector().provideUISearchController(delegate: categoriesViewController)
        categoriesViewController.definesPresentationContext = true
        return categoriesViewController
    }
    
}
