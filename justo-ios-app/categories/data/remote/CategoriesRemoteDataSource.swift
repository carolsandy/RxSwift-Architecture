import Foundation
import Apollo
import RxSwift

class CategoriesRemoteDataSource {
    
    private let CATEGORIES_LEVEL = 0
    private let CATEGORIES_FIRST = 20
    private let apolloClient: ApolloClient
    
    init(apolloClient: ApolloClient) {
        self.apolloClient = apolloClient
    }
    
    func fetchCategories() -> Observable<FetchCategoriesQuery.Data.Category> {
        return apolloClient.apolloRX.fetch(query: FetchCategoriesQuery.init(level: CATEGORIES_LEVEL, first: CATEGORIES_FIRST)).compactMap { data in data.categories }
    }
}
