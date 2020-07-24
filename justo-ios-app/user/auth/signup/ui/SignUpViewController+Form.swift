import Foundation
import UIKit

extension SignUpViewController: UITextFieldDelegate {
    
    func configureForm() {
        textFields.forEach { textField in
            textField.delegate = self
            textField == confirmPasswordView.textField
                ? (textField.returnKeyType = .done)
                : (textField.returnKeyType = .next)
        }
        
        zipCodeView.keyboard = .numberPad
        emailView.keyboard = .emailAddress
        passwordView.isSecureEntry = true
        passwordView.clearButton = .never
        confirmPasswordView.isSecureEntry = true
        confirmPasswordView.clearButton = .never
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let selectedIndex = textFields.firstIndex(of: textField), selectedIndex < textFields.count - 1 {
            textFields[selectedIndex + 1].becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
