import UIKit

class CategoriesViewController: UIViewController, CategoriesUI, MissingSomethingDelegate {
    
    @IBOutlet weak var missingSomethingView: MissingSomethingView!
    @IBOutlet weak var categoriesTitle: UILabel!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var presenter: CategoriesPresenter!
    
    var categories: [Category] = [] {
        didSet {
            categoriesCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        getCategories()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setDefaultNavigationOptions()
    }
    
    func configureCollectionView() {
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        
        let headerNib = UINib(nibName: CategoryConstants.nibForHeaderCell, bundle: nil)
        categoriesCollectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CategoryConstants.identifierForHeaderCell)
        let categoryNib = UINib(nibName: CategoryConstants.nibForCategoryCell, bundle: nil)
        categoriesCollectionView.register(categoryNib, forCellWithReuseIdentifier: CategoryConstants.identifierForCategoryCell)
    }
    
    private func getCategories() {
        presenter.getCategories()
    }
    
    func showLoader() {
        activityIndicator.start()
    }
    
    func hideLoader() {
        activityIndicator.stop()
    }
    
    func showCategoriesSucces(categories: [Category]) {
        self.categories = categories
        categoriesCollectionView.show()
        missingSomethingView.hide()
    }
    
    func showCategoriesError(message: String) {
        categoriesCollectionView.hide()
        missingSomethingView.title = .localizeString(for: "Network Error Title")
        missingSomethingView.subject = .localizeString(for: "Network Error Label")
        missingSomethingView.image = "networkError"
        missingSomethingView.delegate = self
    }
    
    func missingSomethingRetry() {
        getCategories()
    }
}
