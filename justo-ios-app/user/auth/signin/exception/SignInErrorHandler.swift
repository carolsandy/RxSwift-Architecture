import Foundation

class SignInErrorHandler {
    
    private let minCharactersPassword = 5
    
    func areUserValidCredentials(userCredentials: UserCredentials) -> (invalid: Bool, error: SignInError) {
        if userCredentials.email.isEmpty || !StringConstants.isValidEmail(text: userCredentials.email) {
            return (invalid: true, error: .email(String.localizeString(for: "Email Error")))
        } else if userCredentials.password.count < minCharactersPassword {
            return (invalid: true, error: .password(String.localizeString(for: "Password Error")))
        }
        return (invalid: false, error: .noValidationNeeded)
    }
}

enum SignInError: Error {
    case email(String)
    case password(String)
    case graphQL(String)
    case noValidationNeeded
}
