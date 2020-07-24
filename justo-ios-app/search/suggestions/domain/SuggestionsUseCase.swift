import Foundation
import UIKit
import RxSwift

class SuggestionsUseCase {
    
    private let suggestionsRepository: SuggestionsRepository!
    
    init(suggestionsRepository: SuggestionsRepository) {
        self.suggestionsRepository = suggestionsRepository
    }
    
    func fetchSuggestions(with query: String) -> Observable<[String]> {
        return self.suggestionsRepository.fetchSuggestions(with: query)
    }
}
