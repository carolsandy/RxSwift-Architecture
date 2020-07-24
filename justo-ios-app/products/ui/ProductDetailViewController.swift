import UIKit

class ProductDetailViewController: UIViewController, ProductDetailUI, ProductSelectionDelegate, SignInNavigationDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionTextLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var variantsView: VariantsView!
    @IBOutlet weak var descriptionView: UIStackView!
    @IBOutlet weak var addProductButton: UIButton!
    
    var presenter: ProductDetailPresenter!
    var productId: String?
    private let minVariants = 2
    private var product: Product?
    private var quantity: Int = .zero
    private var variantSelected: String = .localizeString(for: "Piece Text")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        setNavigationItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setDefaultNavigationOptions(isTabBarHidden: true)
        presenter.getOrFetchUser(forceFetchUser: true)
        if let id = productId { presenter.getProduct(id: id) }
    }
    
    private func setNavigationItems() {
        updateNavCartBadge(image: "cartLine", action: #selector(showCartOrSignIn), target: self, badgeValue: .zero)
    }
    
    func configureViews() {
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        addProductButton.roundedStyle(title: .localizeString(for: "Add Text"), backgroundColor: .supernova)
        descriptionView.hide()
    }
    
    @objc func showCartOrSignIn() {
        presenter.openCartViewController()
    }
    
    func showProductDescription(description: String) {
        if let description = description.fromHtmlToText?.string, !description.isEmpty {
            descriptionView.show()
            descriptionLabel.attributedText = String.localizeString(for: "Description Text")
                .asAttributedText(with: .bodyBold(), color: .black50, spacing: ProductsConstants.maxLineSpacing)
            descriptionTextLabel.attributedText = description.asAttributedText(with: .bodyRegular(), color: .black50, spacing: ProductsConstants.maxLineSpacing)
        }
    }

    @IBAction func addProduct(_ sender: UIButton) {
        guard let variant = getProductVariants()?.first else { return }
        presenter.updateCheckoutLine(checkoutLineUpdate: CheckoutLineUpdate(quantity: quantity, variantId: variant.id))
    }

    private func getProductVariants() -> [ProductVariant]? {
        guard let product = product else { return [] }
        return (product.variant.count < minVariants) ? product.variant : product.variant.filter { variant in variant.name == variantSelected }
    }

    func updateBadge(quantity: Int) {
        updateNavCartBadge(image: "cartLine", action: #selector(showCartOrSignIn), target: self, badgeValue: quantity)
    }
    
    func showProductSuccess(product: Product) {
        self.product = product
        imageView.load(with: product.thumbnail.asURL())
        nameLabel.attributedText = product.name.asAttributedText(with: .bodySemibold(with: .title2), spacing: ProductsConstants.minLineSpacing)
        categoryLabel.attributedText = product.category.name.asAttributedText(with: .bodyRegular(with: .title2), spacing: ProductsConstants.minLineSpacing)
        variantsView.price = product.price
        variantsView.variants = product.variant
        variantsView.quantity = product.availability
        variantsView.weight = product.weight
        variantsView.productSelectionDelegate = self
        showProductDescription(description: product.description)
    }
    
    func showProductError(message: String) {
        showToast(message: "Unknown Error Title")
    }
    
    func showCartViewController() {
        self.navigationController?.pushViewController(ShoppingInjector().provideCartViewController(), animated: true)
    }
    
    func showCheckoutUpdate(quantity: Int) {
        updateNavCartBadge(image: "cartLine", action: #selector(showCartOrSignIn), target: self, badgeValue: quantity)
    }
    
    func showCheckoutUpdateError() {
        showToast(message: .localizeString(for: "Update shopping Cart Error"))
    }
    
    func showSignInViewController(hasNextController: Bool) {
        presentSignInViewController(hasNextController: hasNextController, signInNavigationDelegate: self)
    }
    
    func showLoader() {
        activityIndicator.start()
    }
    
    func hideLoader() {
        activityIndicator.stop()
    }
    
    func updateProductItem(quantity: Int) {
        self.quantity = quantity
    }
    
    func selectedVariant(variant: String) {
        variantSelected = variant
    }
    
    func dismissModalSignIn(hasNextController: Bool) {
        if hasNextController { showCartViewController() }
        presenter.getOrFetchUser()
    }
}
