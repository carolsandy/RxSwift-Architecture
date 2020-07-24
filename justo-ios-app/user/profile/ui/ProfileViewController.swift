import UIKit

class ProfileViewController: UIViewController, UserUI {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var presenter: UserPresenter!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setDefaultNavigationOptions(isTabBarHidden: true, title: .localizeString(for: "My Account Title"))
        setNavigationItems()
        configureViews()
        presenter.getUser()
    }
    
    private func setNavigationItems() {
        setLeftNavigationItem(action: #selector(popNavigationController(_:)), target: self)
        setRightNavigationItem(image: "edit", action: #selector(initEditViewController(_:)), target: self)
    }
    
    func configureViews() {
        activityIndicator.stop()
        tableView.dataSource = self
        tableView.delegate = self
        let profileCellNib = UINib(nibName: UserConstants.nibForProfileCell, bundle: nil)
        tableView.register(profileCellNib, forCellReuseIdentifier: UserConstants.identifierForProfileCell)
        tableView.separatorStyle = .none
    }
    
    @IBAction func initEditViewController(_ sender: Any) {
        self.navigationController?.pushViewController(UserInjector().provideEditProfileViewController(), animated: true)
    }
    
    @IBAction func popNavigationController(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func showUserInfo(user: User) {
        nameLabel.attributedText = "\(user.firstName) \(user.lastName)".asAttributedText(with: .bodyRegular(), color: .black)
        mailLabel.attributedText = "\(user.email)".asAttributedText(with: .bodyRegular(), color: .gray)
    }
    
    func backToHome() {
        self.navigationController?.popToRootViewController(animated: true)
        updateTabCartBadge(cartItems: .zero)
    }
    
    func showLoader() {
        activityIndicator.start()
    }
    
    func hideLoader() {
        activityIndicator.stop()
    }
}
