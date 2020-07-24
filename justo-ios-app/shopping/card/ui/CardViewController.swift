import UIKit

class CardViewController: UIViewController, CardUI {
    
    @IBOutlet var formViews: [ErrorTextFieldView]!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var ownerView: ErrorTextFieldView!
    @IBOutlet weak var ownerWarningLabel: UILabel!
    @IBOutlet weak var cardNumberView: ErrorTextFieldView!
    @IBOutlet weak var secureCodeView: ErrorTextFieldView!
    @IBOutlet weak var monthView: ErrorTextFieldView!
    @IBOutlet weak var yearView: ErrorTextFieldView!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var expirationDateLabel: UILabel!
    @IBOutlet weak var saveCardSwitch: UISwitch!
    @IBOutlet weak var saveCardLabel: UILabel!
    
    let progress = Progress(totalUnitCount: ShoppingConstants.totalProgressBar)
    weak var delegate: CardDelegate?
    
    var presenter: CardPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = .localizeString(for: "Add Card")
        self.navigationController?.navigationBar.barTintColor = .white
        configureNavigationBarItems()
        configureKeyboardKeys()
        configureViews()
        setFormData()
    }
    
    private func configureNavigationBarItems() {
        let rightItem = UIBarButtonItem()
            .withCustomStyle(title: "Add Text", font: .bodySemibold(), tintColor: .darkBlueGreen, target: self, action: #selector(addCard))
        let leftItem = UIBarButtonItem()
            .withCustomStyle(title: "Cancel Button", tintColor: .darkBlueGreen, target: self, action: #selector(dissmisCardViewController))
        self.navigationItem.rightBarButtonItem = rightItem
        self.navigationItem.leftBarButtonItem = leftItem
    }
    
    private func configureViews() {
        ownerWarningLabel.setStyle(with: .bodyRegular(with: .caption1), color: .charcoalGray30)
        monthLabel.setStyle(with: .bodyRegular(with: .caption1), color: .charcoalGray30)
        yearLabel.setStyle(with: .bodyRegular(with: .caption1), color: .charcoalGray30)
        expirationDateLabel.setStyle(with: .bodyRegular(with: .caption1), color: .red)
        saveCardSwitch.onTintColor = .midnightBlue
        saveCardLabel.setStyle(with: .bodyRegular(with: .caption1), color: .black50)
        progressView.configure()
    }
    
    private func setFormData() {
        ownerView.placeholder = "Card Name Placeholder"
        cardNumberView.placeholder = "Card Number Placeholder"
        secureCodeView.placeholder = "Card Secure Code Placeholder"
        monthView.placeholder = "Expiration Month Placeholder"
        yearView.placeholder = "Expiration Year Placeholder"
        ownerWarningLabel.text = .localizeString(for: "Card Name Warning")
        monthLabel.text = .localizeString(for: "Month")
        yearLabel.text = .localizeString(for: "Year")
        saveCardLabel.text = .localizeString(for: "Save Card")
    }
    
    @objc private func dissmisCardViewController() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @objc private func addCard() {
        let card = Card(name: ownerView.value, number: cardNumberView.value, expirationMonth: monthView.value, expirantionYear: yearView.value, cvv: secureCodeView.value, shouldSave: saveCardSwitch.isOn)
        presenter.addCard(card: card)
    }
    
    func showLoader() {
        progressView.start(with: progress)
    }
    
    func hideLoader() {
        progressView.stop(with: progress)
    }
    
    func showAddCardSuccess(openPayPayment: OpenPayPayment) {
        delegate?.addedCard(openPayPayment: openPayPayment)
        dissmisCardViewController()
    }
    
    func showAddCardError(errorType: Error) {
        switch errorType {
        case CardError.holderName(let error):
            ownerView.shouldShowError(isHidden: false, errorMessage: error)
        case CardError.number(let error):
            cardNumberView.shouldShowError(isHidden: false, errorMessage: error)
        case CardError.expirationMonth(let error):
            monthView.shouldShowError(isHidden: false, errorMessage: error)
        case CardError.expirationYear(let error):
            yearView.shouldShowError(isHidden: false, errorMessage: error)
        case CardError.validDate(let error):
            expirationDateLabel.text = error
        case CardError.cvv(let error):
            secureCodeView.shouldShowError(isHidden: false, errorMessage: error)
        case CardError.openPay(let error):
            showErrorAlert(errorMessage: error)
        case RxApolloError.httpException(let error):
            showErrorAlert(errorMessage: error)
        default:
            showErrorAlert(errorMessage: errorType.localizedDescription)
        }
    }
    
    func showErrorAlert(errorMessage: String) {
        self.showDefaultAlert(title: .localizeString(for: "Unknown Error Title"),
                              message: .localizeString(for: errorMessage),
                              completion: { _ in self.progressView.reset(); return })
    }
    
    func resetForm() {
        progressView.reset()
        formViews.forEach { view in view.shouldShowError(isHidden: true) }
        expirationDateLabel.text = StringConstants.empty
    }
}

protocol CardDelegate: AnyObject {
    func addedCard(openPayPayment: OpenPayPayment)
}
