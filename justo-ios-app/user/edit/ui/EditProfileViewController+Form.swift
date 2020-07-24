import Foundation
import UIKit

extension EditProfileViewController: UITextFieldDelegate {
    
    func configureKeyboardKeys() {
        firstNameTextView.textField.delegate = self
        firstNameTextView.returnKey = .next
        lastNameTextView.textField.delegate = self
        lastNameTextView.returnKey = .done
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField == firstNameTextView.textField ? lastNameTextView.textField.becomeFirstResponder() : textField.resignFirstResponder()
    }
    
}
