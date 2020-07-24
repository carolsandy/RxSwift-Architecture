import UIKit

class FiltersViewController: UIViewController {
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceMinTextField: UITextField!
    @IBOutlet weak var priceMaxTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBarItems()
        configureViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setDefaultNavigationOptions(title: .localizeString(for: "Filters Title"), isShadowHidden: false)
    }
    
    func configureNavigationBarItems() {
        let rightItem = UIBarButtonItem()
            .withCustomStyle(title: "Apply Button Title", font: .bodySemibold(), tintColor: .darkBlueGreen, target: self, action: nil)
        let leftItem = UIBarButtonItem()
            .withCustomStyle(title: "Clean Button Title", tintColor: .darkBlueGreen, target: self, action: nil)

        self.navigationItem.rightBarButtonItem = rightItem
        self.navigationItem.leftBarButtonItem = leftItem
        self.navigationItem.leftBarButtonItem?.isEnabled = false
    }
    
    func configureViews() {
        priceLabel.attributedText = String.localizeString(for: "Price").asAttributedText(with: .bodyMedium())
        priceMinTextField.withPlaceholder(text: "Min Price Placeholder")
        priceMaxTextField.withPlaceholder(text: "Max Price Placeholder")
    }
}
