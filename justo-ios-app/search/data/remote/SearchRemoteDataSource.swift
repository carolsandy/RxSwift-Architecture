import Foundation
import UIKit

import Apollo
import RxSwift

class SearchRemoteDataSource {
    
    private let apolloClientBuilder: ApolloClientBuilder
    private let productPageSize = 20
    
    init(apolloClientBuilder: ApolloClientBuilder) {
        self.apolloClientBuilder = apolloClientBuilder
    }
    
    func search(searchRequest: SearchRequest, token: String) -> Observable<ProductInfo> {
        return apolloClientBuilder.createApolloClientWith(token: token).apolloRX.fetch(query: searchRequest.asSearchQuery())
            .compactMap { data in data.products?.asProductInfo() }
    }
}
