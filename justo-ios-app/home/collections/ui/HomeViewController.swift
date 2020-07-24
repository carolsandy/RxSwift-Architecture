import UIKit

class HomeViewController: UIViewController, HomeUI, ProductsCollectionUI, CollectionSelectedAction, MissingSomethingDelegate, SignInNavigationDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var missingSomethingView: MissingSomethingView!
    
    var presenter: HomePresenter!
    
    var collections: [HomeCollection] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setDefaultNavigationOptions()
        setNavigationItems()
        getCollections(isRefresh: false)
        presenter.getOrFetchUser(forceFetchUser: true)
    }
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.refreshControl = UIRefreshControl().configureRefreshControl(action: #selector(updateCollections), target: self)
        
        let productsCellNib = UINib(nibName: HomeConstants.nibForProductsCollection, bundle: nil)
        collectionView.register(productsCellNib, forCellWithReuseIdentifier: HomeConstants.identifierForProductsCollection)
        
        let highlightsCellNib = UINib(nibName: HomeConstants.nibForHighlightsCollection, bundle: nil)
        collectionView.register(highlightsCellNib, forCellWithReuseIdentifier: HomeConstants.identifierForHighlightsCollection)
        
        let categoriesCellNib = UINib(nibName: HomeConstants.nibForCategoriesCollection, bundle: nil)
        collectionView.register(categoriesCellNib, forCellWithReuseIdentifier: HomeConstants.identifierForCategoriesCollection)
    }

    private func getCollections(isRefresh: Bool) {
        presenter.fetchCollections(isRefresh: isRefresh)
    }
    
    @objc private func updateCollections() {
        getCollections(isRefresh: true)
    }
    
    private func configureMissingSomethingView(title: String, description: String, image: String) {
        collectionView.hide()
        missingSomethingView.show()
        missingSomethingView.title = title
        missingSomethingView.subject = description
        missingSomethingView.image = image
        missingSomethingView.delegate = self
    }
    
    func showLoader() {
        activityIndicator.start()
    }
    
    func hideLoader() {
        activityIndicator.stop()
    }

    func updateBadge(quantity: Int) {
        updateTabCartBadge(cartItems: quantity)
    }
    
    func showCollectionsSuccess(collections: [HomeCollection], shouldRefresh: Bool) {
        if shouldRefresh { self.collectionView.refreshControl?.endRefreshing() }
        self.collections = collections
        collectionView.show()
        missingSomethingView.hide()
    }
    
    func showCollectionsError(message: String) {
        configureMissingSomethingView(title: .localizeString(for: "Unknown Error Title"), description: .localizeString(for: "Unknown Error Label"), image: "homeError")
    }
    
    func showNetworkError() {
        configureMissingSomethingView(title: .localizeString(for: "Network Error Title"), description: .localizeString(for: "Network Error Label"), image: "networkError")
    }
    
    func showProfileViewController() {
        let controller = UserInjector().provideProfileViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func showSignInViewController(hasNextController: Bool) {
        presentSignInViewController(hasNextController: hasNextController, signInNavigationDelegate: self)
    }
    
    func showProductDetail(with id: String) {
        let controller = ProductsInjector().provideProductDetailViewController(productId: id)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func showCollectionViewController(collectionId: String) {
        let controller = CollectionInjector().provideCollectionViewController(collectionId: collectionId)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    private func setNavigationItems() {
        let leftItem = UIBarButtonItem().withCustomLabel(text: "Home Title Text")
        let rightItem = UIBarButtonItem().withImage(image: "user",
                                                    target: self,
                                                    action: #selector(initSignInViewController(_:)))
        self.navigationItem.rightBarButtonItem = rightItem
        self.navigationItem.leftBarButtonItem = leftItem
    }
    
    @IBAction func initSignInViewController(_ sender: Any) {
        presenter.openProfileViewController()
    }
    
    func updateLine(variantId: String, quantity: Int) {
        presenter.updateCheckoutLine(checkoutLineUpdate: CheckoutLineUpdate(quantity: quantity, variantId: variantId))
    }
    
    func updateCartBadge(quantity: Int) {
        updateTabCartBadge(cartItems: quantity)
    }
    
    func showUpdateProductError() {
        showToast(message: "Update shopping Cart Error")
    }
    
    func missingSomethingRetry() {
        getCollections(isRefresh: true)
    }
    
    func dismissModalSignIn(hasNextController: Bool) {
        presenter.getOrFetchUser()
    }
}
