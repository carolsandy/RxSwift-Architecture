import Foundation
import UIKit

extension CategoriesViewController: UISearchBarDelegate, SuggestionsDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, query.count > SearchConstants.minQueryLength else { return }
        let searchViewController = SearchInjector().provideSearchViewController(query: query)
        self.navigationController?.pushViewController(searchViewController, animated: true)
        self.navigationItem.searchController?.isActive = false
    }
    
    func selectedSuggestion(query: String) {
        let searchController = SearchInjector().provideSearchViewController(query: query)
        self.navigationController?.pushViewController(searchController, animated: true)
        self.navigationItem.searchController?.isActive = false
    }
    
}
