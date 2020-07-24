import UIKit

class SearchViewController: UIViewController, SearchUI, SignInNavigationDelegate, MissingSomethingDelegate {
    
    @IBOutlet weak var subcategoriesCollectionView: UICollectionView!
    @IBOutlet weak var productsCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var missingSomethingView: MissingSomethingView!
    
    var presenter: SearchPresenter!
    var category = StringConstants.empty
    var subcategory = StringConstants.empty
    var query = StringConstants.empty
    
    var subcategoriesDataSource:  UICollectionSubcategoriesDataSource!
    var productsDataSource: UICollectionProductsDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDefaultNavigationOptions(isTabBarHidden: true)
        setSearchController()
        setCollectionViews()
        performSearch(isRefresh: false)
        setNavigationItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.isTabBarHidden(hidden: true)
        presenter.getOrFetchUser(forceFetchUser: true)
    }
    
    func setSearchController() {
        if #available(iOS 11.0, *) { self.navigationItem.hidesSearchBarWhenScrolling = false }
    }
    
    func setCollectionViews() {
        activityIndicator.hide()
        subcategoriesDataSource.collectionView = subcategoriesCollectionView
        subcategoriesDataSource.subcategoriesCollectionDelegate = self
        productsDataSource.collectionView = productsCollectionView
        productsDataSource.productsCollectionDelegate = self
        productsCollectionView.refreshControl = UIRefreshControl().configureRefreshControl(action: #selector(updateProducts), target: self)
    }
    
    private func setNavigationItems() {
        updateNavCartBadge(image: "cartLine", action: #selector(showCartOrSignIn), target: self, badgeValue: .zero)
    }
    
    private func performSearch(isRefresh: Bool) {
        let searchRequest = SearchRequest(query: query, categoryParent: category, categories: [category])
        presenter.search(searchRequest: searchRequest, isRefresh: isRefresh)
    }
    
    @objc private func updateProducts() {
        performSearch(isRefresh: true)
    }
    
    @objc func showCartOrSignIn() {
        presenter.openCartViewController()
    }
    
    private func configureMissingSomethingView(title: String, description: String, image: String) {
        productsCollectionView.hide()
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

    func updateCartBadge(quantity: Int) {
        updateNavCartBadge(image: "cartLine", action: #selector(showCartOrSignIn), target: self, badgeValue: quantity)
    }

    func showSearchSuccess(searchResult: SearchResult, shouldRefresh: Bool) {
        missingSomethingView.hide()
        productsCollectionView.show()
        if shouldRefresh { self.productsCollectionView.refreshControl?.endRefreshing() }
        setTitle(searchType: searchResult.type.searchBy, title: searchResult.type.title)
        updateDataSources(with: searchResult)
    }
    
    func showSearchError(message: String) {
        configureMissingSomethingView(title: .localizeString(for: "Network Error Title"), description: .localizeString(for: "Network Error Label"), image: "networkError")
    }
    
    func updateProductsSuccess(searchResult: SearchResult) {
        missingSomethingView.hide()
        productsCollectionView.show()
        updateDataSources(with: searchResult)
    }
    
    func updateProductsError(message: String) {
        configureMissingSomethingView(title: .localizeString(for: "Network Error Title"), description: .localizeString(for: "Network Error Label"), image: "networkError")
    }
    
    func loadMoreSuccess(searchResult: SearchResult) {
        productsDataSource.productInfo = searchResult.productInfo
    }
    
    func loadMoreError(message: String) {
        print(message)
    }
    
    private func updateDataSources(with result: SearchResult) {
        subcategoriesDataSource.category = result.category
        productsDataSource.productInfo = result.productInfo
    }
    
    func showCartViewController() {
        self.navigationController?.pushViewController(ShoppingInjector().provideCartViewController(), animated: true)
    }
    
    func showSignInViewController(hasNextController: Bool) {
        presentSignInViewController(hasNextController: hasNextController, signInNavigationDelegate: self)
    }
    
    func dismissModalSignIn(hasNextController: Bool) {
        if hasNextController { showCartViewController() }
        presenter.getOrFetchUser()
    }

    func showUpdateProductError() {
        showToast(message: "Update shopping Cart Error")
    }
    
    func showEmptySearch() {
        configureMissingSomethingView(title: .localizeString(for: "Empty Results Title"), description: .localizeString(for: "Empty Results Description"), image: "noResults")
    }
    
    func missingSomethingRetry() {
        performSearch(isRefresh: true)
    }
}
