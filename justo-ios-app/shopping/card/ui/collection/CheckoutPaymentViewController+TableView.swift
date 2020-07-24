import Foundation
import UIKit

extension CheckoutPaymentViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AddressViewCell.reuseIdentifier, for: indexPath) as! CardViewCell
        let card = cards[indexPath.row]
        cell.bind(card: card)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? CardViewCell {
            cell.isSelected = !cell.isSelected
            selectedCard = cards[indexPath.row]
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return ShoppingConstants.heightForCheckoutCard
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func selectDefaultRow() {
        let itemIndex = cards.firstIndex { card in card.isDefault } ?? .zero
        let indexPath = IndexPath(item: itemIndex, section: .zero)
        cardsTableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        selectedCard = cards[indexPath.row]
    }
}
