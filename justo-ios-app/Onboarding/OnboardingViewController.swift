import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    var items: [OnboardingPage] = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMainView()
        configureCollectionView()
        items = self.getOnboardingData()
    }
    
    private func configureMainView() {
        pageControl.transform = CGAffineTransform(scaleX: OnboardingConstants.minSizePageIndicator, y: OnboardingConstants.minSizePageIndicator)
        pageControl.numberOfPages = items.count
        pageControl.currentPage = .zero
        dismissButton.defaultStyle(title: "Dismiss Button", titleColor: .darkBlueGreen, font: .bodySemibold(with: .subhead), fontSpacing: .zero)
        startButton.roundedStyle(title: "Start Button", backgroundColor: .supernova)
        startButton.isHidden = true
    }
    
    private func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.isPagingEnabled = true
        collectionView.register(OnboardingPageCell.nib, forCellWithReuseIdentifier: OnboardingPageCell.reuseIdentifier)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        if pageControl.currentPage == OnboardingConstants.lastPage {
            dismissButton.isHidden = true
            startButton.isHidden = false
        } else {
            dismissButton.isHidden = false
            startButton.isHidden = true
        }
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
    @IBAction func initHomeTabController(_ sender: Any) {
        makeOnboardingVisited()
        self.navigationController?.pushViewController(HomeTabBarInjector().provideHomeTabBarController(), animated: true)
    }
    
    func makeOnboardingVisited() {
        UserDefaults.standard.set(true, forKey: OnboardingConstants.hasVisitedOnboarding)
    }
    
}
