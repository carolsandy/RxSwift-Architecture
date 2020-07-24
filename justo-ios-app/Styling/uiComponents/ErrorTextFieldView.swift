import Foundation
import UIKit

class ErrorTextFieldView: UIView {
    
    @IBOutlet weak var containerView: UIStackView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    var value: String {
        get { return textField.text ?? StringConstants.empty }
        set { textField.text = newValue }
    }
    
    var placeholder: String? {
        get { return textField.placeholder }
        set { textField.withPlaceholder(text: newValue ?? StringConstants.empty) }
    }
    
    var keyboard: UIKeyboardType {
        get { return textField.keyboardType }
        set { textField.keyboardType = newValue }
    }
    
    var returnKey: UIReturnKeyType {
        get { return textField.returnKeyType }
        set { textField.returnKeyType = newValue }
    }
    
    var clearButton: UITextField.ViewMode {
        get { return textField.clearButtonMode }
        set { textField.clearButtonMode = newValue }
    }
    
    var isSecureEntry: Bool {
        get { return textField.isSecureTextEntry }
        set { textField.isSecureTextEntry = newValue }
    }
    
    var isEnabled: Bool {
        get { return textField.isEnabled }
        set { textField.isEnabled = newValue }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initFromNib()
        errorLabel.hide()
    }
    
    private func initFromNib() {
        Bundle.main.loadNibNamed(StringConstants.errorTextFieldViewNib, owner: self, options: nil)
        containerView.fixInView(self)
    }
    
    func shouldShowError(isHidden: Bool, errorMessage: String = StringConstants.empty) {
        errorLabel.attributedText = errorMessage.asAttributedText(with: .bodyRegular(with: .caption1), color: .red)
        if isHidden {
            errorLabel.hide()
            textField.layer.borderColor = UIColor.lightBlueGray.cgColor
        } else {
            textField.layer.borderColor = UIColor.red.cgColor
            errorLabel.show()
        }
    }
    
}
