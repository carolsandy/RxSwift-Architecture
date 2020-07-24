import Foundation
import UIKit
import CoreData
import Apollo

class HomeInjector {
    
    fileprivate func provideApolloClient() -> ApolloClient {
        return Network.shared.apolloClient
    }
    
    fileprivate func provideApolloClientBuilder() -> ApolloClientBuilder {
        return ApolloClientBuilder()
    }
    
    fileprivate func provideManagedContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        return appDelegate?.persistentContainer.viewContext
            ?? NSManagedObjectContext.init(concurrencyType: .mainQueueConcurrencyType)
    }
    
    fileprivate func provideCollectionsRemoteDataSource() -> CollectionsRemoteDataSource {
        return CollectionsRemoteDataSource(apolloClientBuilder: provideApolloClientBuilder())
    }
    
    fileprivate func provideProfileLocalDataSource() -> UserLocalDataSource {
        return UserLocalDataSource(managedContext: provideManagedContext())
    }
    
    fileprivate func provideUserRemoteDataSource() -> UserRemoteDataSource {
        return UserRemoteDataSource(apolloClientBuilder: provideApolloClientBuilder())
    }
    
    fileprivate func provideCollectionsRepository() -> CollectionsRepository {
        return CollectionsRepository(collectionsRemoteDataSource: provideCollectionsRemoteDataSource())
    }
    
    fileprivate func provideCollectionsUseCase() -> GetCollectionsUseCase {
        let categoriesRepository = CategoriesInjector().provideCategoriesRepository()
        let userRepository = UserInjector().provideUserRepository()
        return GetCollectionsUseCase(collectionsRepository: provideCollectionsRepository(),
                                     categoriesRepository: categoriesRepository, userRepository: userRepository)
    }
    
    fileprivate func provideHomePresenter(homeUI: HomeUI) -> HomePresenter {
        let homePresenter = HomePresenter(collectionUseCase: provideCollectionsUseCase(), getUserUseCase: UserInjector().provideGetUserUseCase(), updateLineCheckoutUseCase: ShoppingInjector().provideUpdateLineCheckoutUseCase())
        homePresenter.ui = homeUI
        return homePresenter
    }
    
    func provideHomeViewController() -> HomeViewController {
        let homeViewController = HomeViewController()
        homeViewController.presenter = provideHomePresenter(homeUI: homeViewController)
        return homeViewController
    }
}
