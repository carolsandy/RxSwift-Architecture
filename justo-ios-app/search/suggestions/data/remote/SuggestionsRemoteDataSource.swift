import Foundation
import UIKit

import Foundation
import Apollo
import RxSwift

class SuggestionsRemoteDataSource {
    
    private let apolloClient: ApolloClient!
    
    init(apolloClient: ApolloClient) {
        self.apolloClient = apolloClient
    }
    
    func fetchSuggestions(with query: String) -> Observable<[String]> {
        let fetchSuggestionsQuery = FetchSuggestionsQuery(query: query)
        return apolloClient.apolloRX.fetch(query: fetchSuggestionsQuery).compactMap { data in data.asSuggestions() }
    }
}
