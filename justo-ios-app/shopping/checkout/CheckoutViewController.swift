import UIKit

class CheckoutViewController: UIViewController, CheckoutAddressDelegate, CheckoutDeliveryDelegate, CheckoutPaymentDelegate {
    
    private var pageViewController: UIPageViewController!
    @IBOutlet weak var addressButton: UIButton!
    @IBOutlet weak var deliveryButton: UIButton!
    @IBOutlet weak var paymentButton: UIButton!
    @IBOutlet weak var pageControl: UIStackView!
    
    var controllers = [UIViewController]()
    var currentIndex: Int = .zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDefaultNavigationOptions(isTabBarHidden: true)
        setNavigationItems()
        configurePageController()
    }
    
    private func setNavigationItems() {
        let barButtonItem = UIBarButtonItem().withImage(image: "backChevron", target: self, action: #selector(didSelectLeftBarButtonItem))
        self.navigationItem.leftBarButtonItem = barButtonItem
    }
    
    private func configurePageController() {
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.delegate = self
        pageViewController.dataSource = self
        pageViewController.view.backgroundColor = .clear
        pageViewController.view.frame = CGRect(x: .zero, y: .zero, width: self.view.frame.width, height: self.view.frame.height)
        self.addChild(pageViewController)
        self.view.addSubview(pageViewController.view)
        pageViewController.setViewControllers([controllers[CheckoutPage.address.rawValue]], direction: .forward, animated: true, completion: nil)
        pageViewController.didMove(toParent: self)
        view.bringSubviewToFront(pageControl)
        updatePage(with: CheckoutPage.address.rawValue)
        setDelegates()
    }
    
    private func setDelegates() {
        (controllers[CheckoutPage.address.rawValue] as? CheckoutAddressViewController)?.checkoutAddressDelegate = self
        (controllers[CheckoutPage.delivery.rawValue] as? CheckoutDeliveryViewController)?.checkoutDeliveryDelegate = self
        (controllers[CheckoutPage.payment.rawValue] as? CheckoutPaymentViewController)?.checkoutPaymentDelegate = self
    }
    
    @objc
    func didSelectLeftBarButtonItem() {
        if currentIndex > ShoppingConstants.pagerMinPosition {
            updatePager(to: .reverse)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func goToDirection(_ sender: UIButton) {
        if currentIndex < controllers.count - ShoppingConstants.pagerMaxPosition && sender.tag > currentIndex && sender.isEnabled {
            updatePager(to: .forward)
        } else if currentIndex > ShoppingConstants.pagerMinPosition && sender.tag < currentIndex {
            updatePager(to: .reverse)
        }
    }
    
    private func updatePager(to direction: UIPageViewController.NavigationDirection) {
        direction == .forward ? (currentIndex += IntConstants.one) : (currentIndex -= IntConstants.one)
        updatePage(with: currentIndex)
        pageViewController.setViewControllers([controllers[currentIndex]], direction: direction, animated: true, completion: nil)
    }
    
    func showDeliveryPage(shippingMethodId: String, shippingMethodPrice: Double, postalCode: String) {
        if let controller = controllers[CheckoutPage.delivery.rawValue] as? CheckoutDeliveryViewController {
            controller.shippingMethodId = shippingMethodId
            controller.shippingMethodPrice = shippingMethodPrice
            controller.postalCode = postalCode
        }
        updatePager(to: .forward)
    }
    
    func showPaymentPage() {
        updatePager(to: .forward)
    }
    
    func showConfirmationViewController(cardFormatted: String) {
        let confirmationOrderViewController = ShoppingInjector().provideConfirmationOrderViewController(cardFormatted: cardFormatted)
        self.navigationController?.pushViewController(confirmationOrderViewController, animated: true)
    }
}
