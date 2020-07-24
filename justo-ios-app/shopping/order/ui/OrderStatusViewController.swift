import UIKit

class OrderStatusViewController: UIViewController {
    
    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var helpLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var supportStackView: UIStackView!
    
    var checkoutOrder: CheckoutOrder?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItems()
        setOrderStatus()
    }
    
    private func setOrderStatus() {
        if let order = checkoutOrder, order.isPaid {
            setStyles(image: "success", titleColor: .darkBlueGreen, message: "Success Order Message")
            titleLabel.text = .localizeString(for: "Success Order Title", argument: order.number)
            helpLabel.attributedText = String.localizeString(for: "Success Order Support").asAttributedText(with: .bodyMedium(), color: .black85)
            emailLabel.attributedText = String.localizeString(for: "Success Order Email").asAttributedText(with: .bodyMedium(), color: .darkBlueGreen)
            supportStackView.show()
        } else {
            setStyles(image: "error", title: "Error Order Title", titleColor: .brickRed, message: "Error Order Message")
        }
    }
    
    private func setStyles(image: String, title: String = StringConstants.empty, titleColor: UIColor, message: String) {
        statusImageView.image = UIImage.init(named: image)
        titleLabel.attributedText = String.localizeString(for: title).asAttributedText(with: .titleBold(with: .body), color: titleColor)
        messageLabel.attributedText = String.localizeString(for: message).asAttributedText(with: .bodyLight(with: .largeTitle), color: .black85)
    }
    
    private func setNavigationItems() {
        var leftBarButton = UIBarButtonItem()
        var rightBarButton = UIBarButtonItem()
        if let order = checkoutOrder, order.isPaid {
            rightBarButton = navigationButton(image: "backClose", action: #selector(didSelectLeftBarButtonItem))
        } else {
            leftBarButton = navigationButton(image: "backChevron", action: #selector(didSelectLeftBarButtonItem))
        }
        self.navigationItem.leftBarButtonItem = leftBarButton
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    private func navigationButton(image: String, action: Selector?) -> UIBarButtonItem{
        return UIBarButtonItem().withImage(image: image, target: self, action: action)
    }
    
    @objc
    private func didSelectLeftBarButtonItem() {
        if let order = checkoutOrder, order.isPaid {
            popToRootViewController()
        } else if let viewControllers = self.navigationController?.viewControllers {
            self.navigationController?.popToViewController(viewControllers[viewControllers.count - ShoppingConstants.popTwoControllers], animated: true)
        }
    }
    
    private func popToRootViewController() {
        if let rootController = self.navigationController?.viewControllers.first {
            rootController.tabBarController?.selectedIndex = TabBarItemTag.home.rawValue
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}
