import Foundation
import UIKit

class SignUpErrorHandler {
    
    private let minCharactersNames = 3
    private let minCharactersPassword = 5
    private let minCharactersZipCode = 4
    
    func areUserValidCredentials(userRegister: UserRegister) -> (error: Bool, message: SignUpError) {
        if userRegister.firstName.isEmpty || userRegister.firstName.count < minCharactersNames {
            return (error: true, message: .firstname(String.localizeString(for: "Empty Field Error")))
        } else if userRegister.lastName.isEmpty || userRegister.lastName.count < minCharactersNames {
            return (error: true, message: .lastname(String.localizeString(for: "Empty Field Error")))
        } else if !StringConstants.isValidEmail(text: userRegister.email) {
            return (error: true, message: .email(String.localizeString(for: "Email Error")))
        } else if userRegister.zipCode.isEmpty || userRegister.zipCode.count < minCharactersZipCode {
            return  (error: true, message: .zipcode(String.localizeString(for: "Zip Code Error")))
        } else if userRegister.password.count < minCharactersPassword {
            return (error: true, message: .password(String.localizeString(for: "Password Error")))
        } else if userRegister.confirmPassword.count < minCharactersPassword || userRegister.password != userRegister.confirmPassword {
            return (error: true, message: .confirmpassword(String.localizeString(for: "Confirm Password Error")))
        } else if !userRegister.acceptTermsAndConditions {
            return (error: true, message: .terms(String.localizeString(for: "Accept Terms Error")))
        } else {
            return (error: false, message: .noValidationNeeded)
        }
    }
}

enum SignUpError: Error {
    case firstname(String)
    case lastname(String)
    case email(String)
    case zipcode(String)
    case password(String)
    case confirmpassword(String)
    case terms(String)
    case graphQL(String)
    case noValidationNeeded
}
