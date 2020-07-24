import Foundation
import UIKit

extension ShippingAddressViewController: UITextFieldDelegate {
    
    func configureKeyboardKeys() {
        intNumberView.keyboard = .numberPad
        postalCodeView.keyboard = .numberPad
        cityView.isEnabled = false
        phoneNumberView.keyboard = .phonePad
        formViews.forEach { errorView in
            errorView.textField.delegate = self
            (errorView == phoneNumberView) ? (errorView.returnKey = .done) : (errorView.returnKey = .next)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let textFieldLength = textField.text?.count ?? .zero
        let lengthToAdd = string.count
        let lengthToReplace = range.length
        let newLength = textFieldLength + lengthToAdd - lengthToReplace
        
        switch textField {
        case postalCodeView.textField:
            return newLength <= CheckoutAddressFormHandler.minCharactersPostalCode
        case phoneNumberView.textField:
            return newLength <= CheckoutAddressFormHandler.minCharactersPhone
        default:
            return true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case addressNameView.textField:
            firstNameView.textField.becomeFirstResponder()
        case firstNameView.textField:
            lastNameView.textField.becomeFirstResponder()
        case lastNameView.textField:
            streetView.textField.becomeFirstResponder()
        case streetView.textField:
            intNumberView.textField.becomeFirstResponder()
        case intNumberView.textField:
            neighborhoodView.textField.becomeFirstResponder()
        case neighborhoodView.textField:
            postalCodeView.textField.becomeFirstResponder()
        case postalCodeView.textField:
            alcaldiaView.textField.becomeFirstResponder()
        case alcaldiaView.textField:
            phoneNumberView.textField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
}
