import UIKit

class OrdersViewController: UIViewController, OrdersUI, MissingSomethingDelegate {
    
    @IBOutlet weak var ordersTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var missingSomethingView: MissingSomethingView!
    
    var presenter: OrdersPresenter!
    
    var orders: [Order] = [] {
        didSet {
            ordersTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDefaultNavigationOptions(isTabBarHidden: true, title: .localizeString(for: "Orders Title"))
        configureCollectionView()
        presenter.getOrders()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationItems()
        presenter.getOrFetchUser()
    }

    private func setNavigationItems() {
        updateNavCartBadge(image: "cartLine", action: #selector(showCartViewController), target: self, badgeValue: .zero)
        setLeftNavigationItem(action: #selector(didSelectLeftBarButtonItem), target: self)
    }
    
    private func configureCollectionView() {
        ordersTableView.dataSource = self
        ordersTableView.delegate = self
        ordersTableView.register(OrderViewCell.nib, forCellReuseIdentifier: OrderViewCell.reuseIdentifier)
    }
    
    @objc func addOrderToCart(sender: UIButton) {
        presenter.addOrderToCheckout(orderId: orders[sender.tag].id)
    }
    
    @objc func didSelectLeftBarButtonItem() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func showCartViewController() {
        self.navigationController?.pushViewController(ShoppingInjector().provideCartViewController(), animated: true)
    }
    
    func showOrdersSuccess(orders: [Order]) {
        self.orders = orders
        ordersTableView.show()
        missingSomethingView.hide()
    }
    
    func showEmptyOrders() {
        ordersTableView.hide()
        missingSomethingView.show()
        missingSomethingView.title = .localizeString(for: "Empty Orders Title")
        missingSomethingView.subject = .localizeString(for: "Empty Orders Message")
        missingSomethingView.image = "noOrders"
        missingSomethingView.delegate = self
    }

    func showCartUpdated() {
        showToast(message: .localizeString(for: "Order Added to Cart Toast"), isSuccessStyle: true)
    }

    func showCartUpdatedError() {
        showToast(message: "Update shopping Cart Error")
    }

    func updateBadge(quantity: Int) {
        updateNavCartBadge(image: "cartLine", action: #selector(showCartViewController), target: self, badgeValue: quantity)
    }

    func showOrdersError(message: String) {
        showToast(message: message)
    }
  
    func showLoader() {
        activityIndicator.start()
    }
    
    func hideLoader() {
        activityIndicator.stop()
    }
    
    func missingSomethingRetry() {
        presenter.getOrders()
    }
}
