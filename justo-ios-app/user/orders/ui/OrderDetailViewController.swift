import UIKit

class OrderDetailViewController: UIViewController, OrderDetailUI, MissingSomethingDelegate {
    
    @IBOutlet weak var costView: CostDetailView!
    @IBOutlet weak var addressView: AddressDetailView!
    @IBOutlet weak var deliveryView: ReusableDetailView!
    @IBOutlet weak var paymentView: ReusableDetailView!
    @IBOutlet weak var noteView: ReusableDetailView!
    @IBOutlet weak var productsLabel: UILabel!
    @IBOutlet weak var productsTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var addOrderButton: UIButton!
    @IBOutlet weak var emptyCartView: MissingSomethingView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var presenter: OrderDetailPresenter!
    var orderId: String?
    
    var orderLines: [OrderProductLine] = [] {
        didSet {
            productsTableView.reloadData()
            tableViewHeightConstraint.constant = OrdersConstants.heightForProductCard * CGFloat(orderLines.count)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDefaultNavigationOptions(isTabBarHidden: true)
        configureCollectionView()
        setViews()
        getOrderDetail()
        activityIndicator.start()
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
    
    @objc func didSelectLeftBarButtonItem() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func showCartViewController() {
        self.navigationController?.pushViewController(ShoppingInjector().provideCartViewController(), animated: true)
    }
    
    private func getOrderDetail() {
        if let id = orderId { presenter.getOrder(with: id) }
    }
    
    private func setViews() {
        deliveryView.title = "Delivery Date"
        paymentView.title = "Payment Information"
        noteView.title = "Note Title"
        addOrderButton.roundedStyle(title: String.localizeString(for: "Add to Cart Button"), backgroundColor: .supernova, font: .bodySemibold(), fontColor: .black85)
        emptyCartView.hide()
    }
    
    private func configureCollectionView() {
        productsTableView.dataSource = self
        productsTableView.delegate = self
        productsTableView.register(OrderProductViewCell.nib, forCellReuseIdentifier: OrderProductViewCell.reuseIdentifier)
    }
    
    private func bindData(with order: OrderDetail) {
        costView.products = .localizeString(for: "Products Subtotal %@", argument: String(order.productOrderLines.count))
        costView.subtotal = .localizeString(for: "Cost Template", argument: order.subTotal)
        costView.delivery = .localizeString(for: "Cost Template", argument: order.shippingCost)
        costView.discount = .localizeString(for: "Cost Template", argument: order.discountCost)
        costView.total = .localizeString(for: "Cost Template", argument: order.total)
        addressView.address = buildAddress(with: order)
        addressView.phone = order.phone
        deliveryView.detail = .asFormattedDate(order.deliveryDate)
        paymentView.detail = .localizedStringWithFormat("%@ que termina en %@", order.paymentBrand, order.cardNumber)
        if !order.customerNote.isEmpty { noteView.detail = order.customerNote; noteView.show() }
        productsLabel.text = .localizeString(for: "Total Lines Template", argument: String(order.productOrderLines.count))
        orderLines = order.productOrderLines
    }
    
    private func buildAddress(with order: OrderDetail) -> String {
        return "\(order.shippingAddressStreetAndNumber)\((!order.shippingAddressExtra.isEmpty) ? ", \(order.shippingAddressExtra)" : ""), "
            + "\(order.suburb), \(order.shippingAddressMunicipality), \(order.city)"
    }
    
    @IBAction private func addOrderToCart(_ sender: UIButton) {
        if let orderId = orderId { presenter.addOrderToCheckout(orderId: orderId) }
    }

    private func setupEmptyCart() {
        emptyCartView.title = String.localizeString(for: "Network Error Title")
        emptyCartView.subject = String.localizeString(for: "Network Error Label")
        emptyCartView.image = "networkError"
        emptyCartView.delegate = self
        emptyCartView.show()
        scrollView.hide()
    }

    func showLoader() {
        activityIndicator.start()
    }

    func hideLoader() {
        activityIndicator.stop()
    }
    
    func showOrderSuccess(with order: OrderDetail) {
        self.title = .localizeString(for: "Order # Title Template", argument: order.number)
        bindData(with: order)
        emptyCartView.hide()
        scrollView.show()
    }
    
    func showOrderError(message: String) {
        setupEmptyCart()
    }
    
    func showCartUpdatedError() {
        showToast(message: "Update shopping Cart Error")
    }

    func showCartUpdated() {
        showToast(message: .localizeString(for: "Order Added to Cart Toast"), isSuccessStyle: true)
    }

    func updateBadge(quantity: Int) {
        updateNavCartBadge(image: "cartLine", action: #selector(showCartViewController), target: self, badgeValue: quantity)
    }

    func missingSomethingRetry() {
        if let orderId = orderId { presenter.getOrder(with: orderId) }
    }
}
