import Foundation

class CheckoutAddressFormHandler {
    
    private let minCharacters = 4
    private let minCharactersNames = 3
    static let minCharactersPostalCode = 5
    static let minCharactersPhone = 10
    
    func isValidAddress(addressAddInput: AddressAddInput) -> (error: Bool, message: AddressFormError) {
        if addressAddInput.addressName.count < minCharactersNames {
            return (error: true, message: .addressName(String.localizeString(for: "Name Error")))
        } else if addressAddInput.firstName.count < minCharactersNames {
            return (error: true, message: .firstName(String.localizeString(for: "Name Error")))
        } else if addressAddInput.lastName.count < minCharactersNames {
            return (error: true, message: .lastName(String.localizeString(for: "LastName Error")))
        } else if addressAddInput.streetAddress1.count < minCharacters {
            return (error: true, message: .streetAddress1(String.localizeString(for: "Empty Field Error")))
        } else if addressAddInput.cityArea.count < minCharacters {
            return (error: true, message: .cityArea(String.localizeString(for: "City Area Error")))
        } else if addressAddInput.postalCode.count < CheckoutAddressFormHandler.minCharactersPostalCode || !StringConstants.isValidPostalCode(text: addressAddInput.postalCode) {
            return (error: true, message: .postalCode(String.localizeString(for: "Zip Code Error")))
        } else if addressAddInput.city.count < minCharacters {
            return (error: true, message: .city(String.localizeString(for: "City Error")))
        } else if addressAddInput.phone.count < CheckoutAddressFormHandler.minCharactersPhone {
            return (error: true, message: .phone(String.localizeString(for: "Phone Error")))
        } else {
            return (error: false, message: .noValidationNeeded)
        }
    }
}

enum AddressFormError: Error {
    case addressName(String)
    case firstName(String)
    case lastName(String)
    case streetAddress1(String)
    case city(String)
    case cityArea(String)
    case postalCode(String)
    case phone(String)
    case graphQL(String)
    case noValidationNeeded
}
