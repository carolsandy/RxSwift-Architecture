import UIKit

class CheckoutPaymentViewController: UIViewController, UITextFieldDelegate, CardDelegate, CheckoutPaymentUI {
    
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var discountTextField: ErrorTextFieldView!
    @IBOutlet weak var discountPlaceholderLabel: UILabel!
    @IBOutlet weak var addCardButton: UIButton!
    @IBOutlet weak var cardsTableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var presenter: CheckoutPaymentPresenter!
    weak var checkoutPaymentDelegate: CheckoutPaymentDelegate?
    
    var cards: [SavedCard] = [] {
        didSet {
            cardsTableView.reloadData()
            if !cards.isEmpty { selectDefaultRow() }
        }
    }
    
    var selectedCard: SavedCard? {
        willSet {
            nextButton.enabled()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        configureViews()
        configureTableView()
        presenter.getCards()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard selectedCard != nil else { return }
        nextButton.enabled()
    }
    
    private func configureViews() {
        discountLabel.attributedText = String.localizeString(for: "Discount Label").asAttributedText()
        discountPlaceholderLabel.attributedText = String.localizeString(for: "Discount Warning").asAttributedText(with: .bodyRegular(with: .caption1), color: .charcoalGray30)
        addCardButton.roundedStyle(title: "Add Card", backgroundColor: .darkBlueGreen10, cornerRadius: ShoppingConstants.addressButtonCornerRadius, font: .bodyRegular(), fontColor: .darkBlueGreen, fontSpacing: ShoppingConstants.addressButtonSpacingLetter)
        discountTextField.textField.delegate = self
        discountTextField.placeholder = "Discount Code Placeholder"
        discountTextField.returnKey = .done
        discountTextField.clearButton = .never
        nextButton.roundedStyle(title: "Next Button", backgroundColor: .supernova)
        nextButton.disabled()
    }
    
    private func configureTableView() {
        cardsTableView.delegate = self
        cardsTableView.dataSource = self
        cardsTableView.register(CardViewCell.nib, forCellReuseIdentifier: CardViewCell.reuseIdentifier)
    }
    
    @IBAction func initCardViewController(_ sender: UIButton) {
        let cardViewController = PaymentInjector().provideCardViewController()
        cardViewController.delegate = self
        self.present(UINavigationController(rootViewController: cardViewController), animated: true, completion: nil)
    }
    
    @IBAction func didSelectPaymentMethod(_ sender: Any) {
        if let card = selectedCard {
            let updateCheckoutPaymentInput = UpdateCheckoutPaymentInput(discountCode: discountTextField.value, paymentToken: card.id, shouldSave: card.shouldSave)
            presenter.updatePayment(updateCheckoutPaymentInput: updateCheckoutPaymentInput, isSaved: card.isSaved)
        }
    }
    
    func addedCard(openPayPayment: OpenPayPayment) {
        let card = createCard(payment: openPayPayment)
        selectedCard = card
        cards.insert(card, at: .zero)
    }
    
    private func createCard(payment: OpenPayPayment) -> SavedCard {
        return SavedCard(id: payment.openPayToken.id, brand: payment.openPayToken.brand, lastDigits: payment.openPayToken.lastDigits, isDefault: true, shouldSave: payment.shouldSave)
    }
    
    private func createCardDescription(selectedCard: SavedCard?) -> String {
        if let card = selectedCard {
            return card.brand.isEmpty
            ? (String.localizeString(for: "Card Template", argument: card.lastDigits))
            : (String.localizedStringWithFormat("%@ que termina en %@", card.brand, card.lastDigits))
        }
        return StringConstants.empty
    }
    
    func showLoader() {
        activityIndicator.show()
        nextButton.disabled()
    }
    
    func hideLoader() {
        activityIndicator.stop()
    }
    
    func showCardsSuccess(cards: [SavedCard]) {
        self.cards = cards
    }
    
    func showCardsError(message: String) {
         showToast(message: message)
    }
    
    func showAddPaymentSuccess(checkout: Checkout) {
        checkoutPaymentDelegate?.showConfirmationViewController(cardFormatted: createCardDescription(selectedCard: selectedCard))
    }
    
    func showAddPaymentError(message: String) {
        showToast(message: message)
        nextButton.enabled()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        discountTextField.textField.resignFirstResponder()
        return true
    }
}

protocol CheckoutPaymentDelegate: AnyObject {
    func showConfirmationViewController(cardFormatted: String)
}
