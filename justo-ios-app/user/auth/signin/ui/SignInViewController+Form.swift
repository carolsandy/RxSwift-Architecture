import Foundation
import UIKit

extension SignInViewController: UITextFieldDelegate {
    
    func configureKeyboardKeys() {
        passwordView.textField.delegate = self
        emailView.textField.delegate = self
        emailView.keyboard = .emailAddress
        emailView.returnKey = .next
        passwordView.returnKey = .done
        passwordView.clearButton = .never
        passwordView.isSecureEntry = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField == emailView.textField ? passwordView.textField.becomeFirstResponder() : textField.resignFirstResponder()
    }
    
}
