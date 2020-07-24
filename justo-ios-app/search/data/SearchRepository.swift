import Foundation
import RxSwift

class SearchRepository {
    
    private let searchRemoteDataSource: SearchRemoteDataSource
    
    init(searchRemoteDataSource: SearchRemoteDataSource) {
        self.searchRemoteDataSource = searchRemoteDataSource
    }
    
    func search(searchRequest: SearchRequest, token: String = StringConstants.empty) -> Observable<ProductInfo> {
        return searchRemoteDataSource.search(searchRequest: searchRequest, token: token)
    }
}
