import Foundation
import Apollo
import RxSwift

class CollectionsRemoteDataSource {
    
    private let COLLECTION_SIZE = 10
    private let PAGE_SIZE = 20
    private let apolloClientBuilder: ApolloClientBuilder
    
    init(apolloClientBuilder: ApolloClientBuilder) {
        self.apolloClientBuilder = apolloClientBuilder
    }
    
    func fetchCollections(token: String) -> Observable<[Collection]> {
        return apolloClientBuilder.createApolloClientWith(token: token).apolloRX.fetch(query: createFetchCollectionsQuery())
            .compactMap { data in data.collections?.asCollections() }
    }
    
    private func createFetchCollectionsQuery() -> FetchCollectionsQuery {
        return FetchCollectionsQuery.init(first: COLLECTION_SIZE,
                                          filter: CollectionFilterInput(published: CollectionPublished.published, isHidden: false))
    }
    
    func fetchCollection(id: String, token: String) -> Observable<Collection> {
        let fetchCollectionQuery = FetchCollectionQuery(id: id, first: PAGE_SIZE, after: StringConstants.empty)
        return apolloClientBuilder.createApolloClientWith(token: token).apolloRX.fetch(query: fetchCollectionQuery).compactMap { data in
            data.collection?.asCollection()
        }
    }
}
