import Foundation
import UIKit

class EditUserProfileErrorHandler {
    
    private let minCharactersNames = 5
    
    func isUserUpdateValid(userUpdate: UserUpdateInput) -> (error: Bool, message: EditProfileError) {
        if userUpdate.firstName.isEmpty || userUpdate.firstName.count < minCharactersNames {
            return (error: true, message: .firstName(String.localizeString(for: "Empty Field Error")))
        } else if userUpdate.lastName.isEmpty || userUpdate.lastName.count < minCharactersNames {
            return (error: true, message: .lastName(String.localizeString(for: "Empty Field Error")))
        } else {
            return (error: false, message: .noValidationNeeded)
        }
    }
}

enum EditProfileError: Error {
    case firstName(String)
    case lastName(String)
    case graphQL(String)
    case noValidationNeeded
}
