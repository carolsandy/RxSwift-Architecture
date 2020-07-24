import Foundation
import RxSwift

class CollectionsRepository {
    
    private let collectionsRemoteDataSource: CollectionsRemoteDataSource
    
    init(collectionsRemoteDataSource: CollectionsRemoteDataSource) {
        self.collectionsRemoteDataSource = collectionsRemoteDataSource
    }
    
    func fetchCollections(with token: String = StringConstants.empty) -> Observable<[Collection]> {
        return collectionsRemoteDataSource.fetchCollections(token: token)
    }
    
    func fetchCollection(id: String, token: String = StringConstants.empty) -> Observable<Collection> {
        return collectionsRemoteDataSource.fetchCollection(id: id, token: token)
    }
}
