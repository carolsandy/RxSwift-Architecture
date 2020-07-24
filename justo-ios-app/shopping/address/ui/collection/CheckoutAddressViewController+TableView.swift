import Foundation
import UIKit

extension CheckoutAddressViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addresses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AddressViewCell.reuseIdentifier, for: indexPath) as! AddressViewCell
        let item = addresses[indexPath.row]
        cell.bindData(with: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? AddressViewCell {
            cell.isSelected = !cell.isSelected
            selectedAddress = addresses[indexPath.row]
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return ShoppingConstants.heightForCheckoutAddressCard
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func selectDefaultRow() {
        let itemIndex = addresses.firstIndex { address in address.isDefaultShippingAddress } ?? .zero
        let indexPath = IndexPath(item: itemIndex, section: .zero)
        addressesTableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        selectedAddress = addresses[indexPath.row]
    }
}

protocol CheckoutAddressDelegate: UI {
    func showDeliveryPage(shippingMethodId: String, shippingMethodPrice: Double, postalCode: String)
}
