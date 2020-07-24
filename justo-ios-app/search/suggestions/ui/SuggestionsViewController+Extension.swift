import Foundation
import UIKit

extension SuggestionsViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchConstants.identifierForResultCell, for: indexPath)
        let item = results[indexPath.row]
        cell.textLabel?.textColor = .black50
        cell.textLabel?.attributedText = item.withAttributedRange(of: stringToFormat, color: .darkBlueGreen)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let result = results[indexPath.row]
        suggestionsDelegate?.selectedSuggestion(query: result)
    }
    
}

protocol SuggestionsDelegate: AnyObject {
    
    func selectedSuggestion(query: String)
}
