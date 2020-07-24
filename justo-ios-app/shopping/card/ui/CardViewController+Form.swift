import Foundation
import UIKit

extension CardViewController: UITextFieldDelegate {
    
    func configureKeyboardKeys() {
        self.formViews.forEach { textFieldView in
            textFieldView.textField.delegate = self
            textFieldView == ownerView ? (ownerView.keyboard = .alphabet) : (textFieldView.keyboard = .numberPad)
            textFieldView == yearView ? (yearView.returnKey = .done) : (textFieldView.returnKey = .next)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let textFieldLength = textField.text?.count ?? .zero
        let lengthToAdd = string.count
        let lengthToReplace = range.length
        let newLength = textFieldLength + lengthToAdd - lengthToReplace
        
        switch textField {
        case cardNumberView.textField:
            return newLength <= CardFormExceptionHandler.lengthCommonCard
        case secureCodeView.textField:
            return newLength <= CardFormExceptionHandler.minLengthCVV
        case monthView.textField:
            return newLength <= CardFormExceptionHandler.minLengthMonth
        case yearView.textField:
            return newLength <= CardFormExceptionHandler.minLengthYear
        default:
            return true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case ownerView.textField:
            cardNumberView.textField.becomeFirstResponder()
        case cardNumberView.textField:
            secureCodeView.textField.becomeFirstResponder()
        case secureCodeView.textField:
            monthView.textField.becomeFirstResponder()
        case monthView.textField:
            yearView.textField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
    
}
