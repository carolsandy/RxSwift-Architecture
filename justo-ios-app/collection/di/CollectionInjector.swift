import Foundation
import Apollo
import UIKit

class CollectionInjector {
    
    fileprivate func provideApolloClientBuilder() -> ApolloClientBuilder {
        return Network.shared.apolloClientBuilder
    }
    
    fileprivate func provideCollectionsRemoteDataSource() -> CollectionsRemoteDataSource {
        return CollectionsRemoteDataSource(apolloClientBuilder: provideApolloClientBuilder())
    }
    
    fileprivate func providecollectionsRepository() -> CollectionsRepository {
        return CollectionsRepository(collectionsRemoteDataSource: provideCollectionsRemoteDataSource())
    }
    
    fileprivate func provideGetCollectionUseCase() -> GetCollectionUseCase {
        return GetCollectionUseCase(collectionsRepository: providecollectionsRepository(), userRepository: UserInjector().provideUserRepository())
    }
    
    fileprivate func provideCollectionPresenter(collectionUI: CollectionUI) -> CollectionPresenter {
        let collectionPresenter = CollectionPresenter(getCollectionUseCase: provideGetCollectionUseCase(), getUserUseCase: UserInjector().provideGetUserUseCase(), updateLineCheckoutUseCase: ShoppingInjector().provideUpdateLineCheckoutUseCase())
        collectionPresenter.ui = collectionUI
        return collectionPresenter
    }
    
    func provideCollectionViewController(collectionId: String) -> CollectionViewController {
        let layout = UICollectionViewFlowLayout()
        let collectionViewController = CollectionViewController(collectionViewLayout: layout)
        collectionViewController.collectionId = collectionId
        collectionViewController.activityIndicator = UIActivityIndicatorView(style: .gray)
        collectionViewController.presenter = provideCollectionPresenter(collectionUI: collectionViewController)
        return collectionViewController
    }
}
