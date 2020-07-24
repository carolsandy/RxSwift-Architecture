import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet weak var emptyCartView: MissingSomethingView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var shoppingCart: UITableView!
    @IBOutlet weak var summaryView: UIView!
    @IBOutlet weak var purchaseButton: UIButton!
    @IBOutlet weak var productSummaryLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    var presenter: CartPresenter!
    var cartItemsQuantity: Int?
    var checkout: Checkout = Checkout() {
        didSet {
            shoppingCart.reloadData()
            shoppingCart.refreshControl?.endRefreshing()
            setupSummaryView()
            hideCartView(false)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (self.navigationController?.viewControllers.first as? CartViewController) != nil {
            self.setDefaultNavigationOptions(isTabBarHidden: false, title: .localizeString(for: "Cart Text"))
        } else {
            self.setDefaultNavigationOptions(isTabBarHidden: true, title: .localizeString(for: "Cart Text"))
            setLeftNavigationItem(action: #selector(didSelectLeftBarButtonItem), target: self)
        }
        fetchCart(isRefresh: false)
        setupItemsTableView()
        emptyCartView.hide()
        hideCartView(true)
    }
    
    private func setNavigationItems(isCartView: Bool) {
        if isCartView {
            let barButtonItem = UIBarButtonItem().withImage(image: "deleteLines", target: self, action: #selector(clearCart))
            self.navigationItem.rightBarButtonItem = barButtonItem
        } else { navigationItem.rightBarButtonItem = nil }
    }
    
    @objc private func clearCart() {
        showAlert(title: "Clear Cart Title", action: "Clear Cart Action", style: .actionSheet, completion: { _ in self.presenter.clearLines() })
    }
    
    @objc func didSelectLeftBarButtonItem() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setupEmptyCart() {
        setNavigationItems(isCartView: false)
        emptyCartView.title = String.localizeString(for: "Empty Cart Title")
        emptyCartView.subject = String.localizeString(for: "Empty Cart Label")
        emptyCartView.image = "emptyCart"
        emptyCartView.delegate = self
        emptyCartView.show()
        hideCartView(true)
    }
    
    func setupItemsTableView() {
        shoppingCart.register(CartViewCell.nib, forCellReuseIdentifier: CartViewCell.reuseIdentifier)
        shoppingCart.separatorStyle = .none
        shoppingCart.dataSource = self
        shoppingCart.delegate = self
        shoppingCart.allowsSelection = false
        shoppingCart.refreshControl = UIRefreshControl().configureRefreshControl(action: #selector(refreshCartItems), target: self)
    }
    
    func setupSummaryView() {
        if checkout.total < ShoppingConstants.minimunOrderPrice {
            purchaseButton.roundedStyle(title: String.localizeString(for: "Purchase Button"), backgroundColor: .veryLightPinkThree, font: .bodySemibold(), fontColor: .black50)
            purchaseButton.isEnabled = false
            productSummaryLabel.attributedText = String.localizeString(for: "Less than minimum total amout allowed warning").asAttributedText(with: .bodyRegular(with: .footnote), color: .brickRed)
        } else {
            purchaseButton.roundedStyle(title: String.localizeString(for: "Purchase Button"), backgroundColor: .supernova, font: UIFont.bodyRegular(), fontColor: .darkForestGreen)
            productSummaryLabel.attributedText = String.localizeString(for: "Subtotal %@ products", argument: String(checkout.checkoutLines.count)).asAttributedText(with: .bodyRegular(with: .footnote), color: .black50)
            purchaseButton.isEnabled = true
        }
        totalPriceLabel.attributedText = (ShoppingConstants.MXNCurrency + String(checkout.total)).asAttributedText(with: .bodyBold(), color: .black)
    }
    
    private func fetchCart(isRefresh: Bool) {
        presenter.fetchUser(isRefresh: isRefresh)
    }
    
    @objc private func refreshCartItems() {
        fetchCart(isRefresh: true)
    }
    
    @IBAction func didSelectPurchaseButton(_ sender: Any) {
        presenter.openCheckoutViewController()
    }
    
    private func setupSummaryCart(with checkout: Checkout) {
        setNavigationItems(isCartView: true)
        self.checkout = checkout
        emptyCartView.hide()
    }
    
    private func updateCartItems(quantity: Int) {
        updateTabCartBadge(cartItems: quantity)
        cartItemsQuantity = quantity
    }
    
    private func hideCartView(_ isHidden: Bool) {
        shoppingCart.isHidden = isHidden
        summaryView.isHidden = isHidden
    }
}

extension CartViewController: CartUI, MissingSomethingDelegate, UpdateProductItemDelegate {

    func showLoader() {
        activityIndicator.start()
    }

    func hideLoader() {
        activityIndicator.stop()
    }

    func updateCart(with checkout: Checkout) {
        setupSummaryCart(with: checkout)
        updateCartItems(quantity: checkout.checkoutLines.count)
    }
    
    func showEmptyCart(notifyItemsDeleted: Bool) {
        setupEmptyCart()
        if let items = cartItemsQuantity {
            if notifyItemsDeleted {
                showToast(message: .localizeString(for: "Removed items Toast", argument: String(items)), isSuccessStyle: true)
            }
            updateTabCartBadge(cartItems: .zero)
        }
    }
    
    func showError() {
        showToast(message: "Update shopping Cart Error")
    }

    func showCheckoutViewController() {
        let checkoutViewController = ShoppingInjector().provideCheckoutViewController()
        self.navigationController?.pushViewController(checkoutViewController, animated: true)
    }

    func missingSomethingRetry() {
        fetchCart(isRefresh: true)
    }
    
    func updateLine(variantId: String, quantity: Int) {
        presenter.updateLineCheckout(checkoutLineUpdate: CheckoutLineUpdate(quantity: quantity, variantId: variantId))
    }
}

extension CartViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checkout.checkoutLines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CartViewCell.reuseIdentifier, for: indexPath) as! CartViewCell
        cell.updateProductItemDelegate = self
        cell.checkoutLine = checkout.checkoutLines[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ShoppingConstants.heightForCartItem
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?  {
        let configuration = UISwipeActionsConfiguration(actions: [configureDeleteAction(for: indexPath)])
        configuration.performsFirstActionWithFullSwipe = false
        
        return configuration
    }
    
    func configureDeleteAction(for indexPath: IndexPath) -> UIContextualAction {
        let delete = UIContextualAction(style: .normal, title: String.localizeString(for: "Delete Text"), handler: { (action , view, NSAssertionHandler) in
            self.presenter.updateLineCheckout(checkoutLineUpdate: CheckoutLineUpdate(quantity: ShoppingConstants.emptyCart, variantId: self.checkout.checkoutLines[indexPath.row].checkoutVariant.id))
        })
        delete.image = UIImage(named: "delete")
        delete.backgroundColor = .brickRed
        return delete
    }
}
