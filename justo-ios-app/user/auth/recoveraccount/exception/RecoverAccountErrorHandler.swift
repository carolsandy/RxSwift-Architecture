import Foundation

class RecoverAccountErrorHandler {
    
    func isValidEmail(recoverPassword: RecoverPassword) -> (invalid: Bool, error: RecoverPasswordError) {
        return recoverPassword.email.isEmpty || !StringConstants.isValidEmail(text: recoverPassword.email)
            ? (true, .password(.localizeString(for: "Email Error")))
            : (false, .noValidationNeeded)
    }
}

enum RecoverPasswordError: Error {
    case password(String)
    case graphQL(String)
    case noValidationNeeded
}
