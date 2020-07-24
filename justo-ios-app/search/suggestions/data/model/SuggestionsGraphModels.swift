import Foundation

extension FetchSuggestionsQuery.Data {
    
    func asSuggestions() -> [String] {
        return self.autocomplete?.compactMap { value in value?.result } ?? []
    }
}
