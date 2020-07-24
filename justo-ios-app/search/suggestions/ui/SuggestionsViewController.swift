import Foundation
import UIKit

class SuggestionsViewController: UITableViewController, UISearchResultsUpdating, SuggestionsUI {
    
    var stringToFormat = StringConstants.empty
    
    var presenter: SuggestionsPresenter!
    var suggestionsDelegate: SuggestionsDelegate?
    
    var results: [String] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: SearchConstants.identifierForResultCell)
        self.tableView.separatorStyle = .none
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text, query.count > SearchConstants.minQueryLength else { return }
        stringToFormat = query
        presenter.fetchSuggestions(with: query)
    }
    
    func showSuggestionsSuccess(suggestions: [String]) {
        results = suggestions
    }
    
    func showSuggestionsError(message: String) {
        print(message)
    }
    
}
