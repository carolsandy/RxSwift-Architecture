import Foundation
import UIKit

class EditPasswordErrorHandler {
    
    private let minCharactersPassword = 5
    
    func isPasswordUpdateValid(passwordUpdate: PasswordUpdateInput) -> (error: Bool, message: EditPasswordError) {
        if passwordUpdate.newPassword.isEmpty || passwordUpdate.newPassword.count < minCharactersPassword {
            return (error: true, message: .password(String.localizeString(for: "Empty Field Error")))
        } else if passwordUpdate.newPasswordConfirmation.isEmpty || passwordUpdate.newPasswordConfirmation.count < minCharactersPassword {
            return (error: true, message: .passwordConfirmation(String.localizeString(for: "Empty Field Error")))
        } else if passwordUpdate.newPassword != passwordUpdate.newPasswordConfirmation {
            return (error: true, message: .passwordConfirmation(String.localizeString(for: "Confirm Password Error")))
        } else {
            return (error: false, message: .noValidationNeeded)
        }
    }
}

enum EditPasswordError: Error {
    case password(String)
    case passwordConfirmation(String)
    case graphQL(String)
    case noValidationNeeded
}
