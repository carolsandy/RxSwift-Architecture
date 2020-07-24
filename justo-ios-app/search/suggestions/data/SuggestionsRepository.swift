import Foundation
import RxSwift

class SuggestionsRepository {
    
    private let suggestionsRemoteDataSource: SuggestionsRemoteDataSource
    
    init(suggestionsRemoteDataSource: SuggestionsRemoteDataSource) {
        self.suggestionsRemoteDataSource = suggestionsRemoteDataSource
    }
    
    func fetchSuggestions(with query: String) -> Observable<[String]> {
        return suggestionsRemoteDataSource.fetchSuggestions(with: query)
    }
}
