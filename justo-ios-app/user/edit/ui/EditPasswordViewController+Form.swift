import Foundation
import UIKit

extension EditPasswordViewController: UITextFieldDelegate {
    
    func configureKeyboardKeys() {
        passwordView.textField.delegate = self
        passwordView.isSecureEntry = true
        passwordView.returnKey = .next
        passwordView.clearButton = .never
        passwordView.isSecureEntry = true
        confirmPasswordView.textField.delegate = self
        confirmPasswordView.isSecureEntry = true
        confirmPasswordView.returnKey = .done
        confirmPasswordView.clearButton = .never
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField == passwordView.textField ? confirmPasswordView.textField.becomeFirstResponder() : textField.resignFirstResponder()
    }
    
}
