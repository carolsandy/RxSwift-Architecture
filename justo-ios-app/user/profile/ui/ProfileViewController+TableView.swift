import UIKit

enum ProfileOption: Int {
    case myOrders
    /* TODO: Create a task to enable them
     case addresses
     case paymentMethods
     */
    case termsAndConditions
    case privacyNotice
    case exit
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserConstants.sectionsInProfile.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UserConstants.heightForProfileItem
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserConstants.identifierForProfileCell, for: indexPath)
        cell.textLabel?.attributedText = UserConstants.sectionsInProfile[indexPath.row].asAttributedText(with: .bodyRegular(with: .body))
        cell.imageView?.image = UIImage.init(named: UserConstants.cellImages[indexPath.row])
        cell.accessoryView = UIImageView.init(image: UIImage.init(named: UserConstants.profileAccessoryCell))
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedOption = ProfileOption(rawValue: indexPath.row){
            switch selectedOption {
            case .myOrders:
                self.navigationController?.pushViewController(OrdersInjector().provideOrdersViewController(), animated: true)
            /* TODO: Create a task to enable them
                 case .addresses:
                 case .paymentMethods:
                 */
            case .termsAndConditions:
                navigationController?.pushViewController(UserInjector().provideTermsAndConditionsViewController(), animated: true)
            case .privacyNotice:
                navigationController?.pushViewController(UserInjector().providePrivacyAdviceViewController(), animated: true)
            case .exit:
                presenter.closeSession()
            }
        }
    }
}
