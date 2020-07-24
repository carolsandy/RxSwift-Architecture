import Foundation
import UIKit

class CollectionViewController: UICollectionViewController {
    
    var presenter: CollectionPresenter!
    var collectionId: String?
    var collection: Collection? {
        didSet {
            collectionView.reloadData()
        }
    }
    var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        setNavigationItems()
        configureCollectionView()
        getCollection(isRefresh: false)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setTransparentNavigationOptions(isTabBarHidden: true, largeTitles: true)
        presenter.getOrFetchUser(forceFetchUser: true)
    }
    
    private func setNavigationItems() {
        updateNavCartBadge(image: "cartLine", action: #selector(showCartOrSignIn), target: self, badgeValue: .zero)
    }
    
    private func configureViews() {
        let productCellNib = UINib(nibName: HomeConstants.nibForProductCell, bundle: nil)
        collectionView.register(productCellNib, forCellWithReuseIdentifier: HomeConstants.identifierForProductCell)
        let collectionHeaderNib = UINib(nibName: CollectionConstants.nibForCollectionHeader, bundle: nil)
        collectionView.register(collectionHeaderNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionConstants.identifierForCollectionHeader)
        activityIndicator.center = self.view.center
        self.view.addSubview(activityIndicator)
    }
    
    private func getCollection(isRefresh: Bool) {
        guard let id = collectionId else { return }
        presenter.getCollection(by: id, isRefresh: isRefresh)
    }
    
    @objc func updateProducts() {
        getCollection(isRefresh: true)
    }
    
    private func configureCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.refreshControl = UIRefreshControl().configureRefreshControl(action: #selector(updateProducts), target: self)
    }
    
    @objc func showCartOrSignIn() {
        presenter.openCartViewController()
    }
    
    private func showMissingView(image: String, title: String, description: String, isRetryHidden: Bool = false, delegate: MissingSomethingDelegate?) {
        removeMissingView()
        let missingView = MissingSomethingView(frame: view.frame)
        view.addSubview(missingView)
        missingView.title = title
        missingView.subject = description
        missingView.image = image
        missingView.delegate = delegate
    }
    
    private func removeMissingView() {
        if let missingSomethingView = self.view.subviews.last as? MissingSomethingView {
            missingSomethingView.removeFromSuperview()
        }
    }
}

extension CollectionViewController: CollectionUI, MissingSomethingDelegate, SignInNavigationDelegate {

    func showLoader() {
        activityIndicator.start()
    }
    
    func hideLoader() {
        removeMissingView()
        activityIndicator.stop()
    }

    func updateCartBadge(quantity: Int) {
        updateNavCartBadge(image: "cartLine", action: #selector(showCartOrSignIn), target: self, badgeValue: quantity)
    }

    func showCollectionSuccess(collection: Collection, shouldRefresh: Bool) {
        self.collection = collection
        if shouldRefresh { self.collectionView.refreshControl?.endRefreshing() }
    }
    
    func showCollectionError() {
        collectionView.reloadData()
        showMissingView(image: "networkError", title: .localizeString(for: "Network Error Title"), description: .localizeString(for: "Network Error Label"), delegate: self)
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
        
    func missingSomethingRetry() {
        getCollection(isRefresh: true)
    }
}
