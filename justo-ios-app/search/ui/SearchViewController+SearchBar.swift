import Foundation
import UIKit

extension SearchViewController: UISearchBarDelegate, SuggestionsDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, query.count > SearchConstants.minQueryLength else { return }
        category = StringConstants.empty
        subcategory = StringConstants.empty
        self.query = query
        searchByQuery(with: query)
    }
    
    func setTitle(searchType: String, title: String) {
        if searchType == SearchConstants.searchByQuery {
            self.title = .localizeString(for: "Search Results Title")
            self.navigationItem.searchController?.searchBar.text = title
            subcategoriesCollectionView.hide()
        } else {
            self.title = title
        }
    }
    
    func selectedSuggestion(query: String) {
        self.query = query
        searchByQuery(with: query)
    }
    
    private func searchByQuery(with text: String) {
        productsDataSource.products.removeAll()
        presenter.search(searchRequest: SearchRequest(query: text), isRefresh: false)
        self.navigationItem.searchController?.isActive = false
    }
}
