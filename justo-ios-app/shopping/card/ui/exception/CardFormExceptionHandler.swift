import Foundation

class CardFormExceptionHandler {
    
    static let minLength = 3
    static let lengthCommonCard = 16
    static let lengthAmericanExpress = 15
    static let minLengthCVV = 4
    static let minLengthMonth = 2
    static let minLengthYear = 2
    static let invalidCardErrorCode = 1001
    static let openPayErrorCode = -1012
    
    func isValidCard(card: Card) -> (error: Bool, message: CardError) {
        if card.name.count < CardFormExceptionHandler.minLength {
            return (error: true, message: .holderName(String.localizeString(for: "Card Name Error")))
        } else if !isValidNumber(cardNumber: card.number) {
            return (error: true, message: .number(String.localizeString(for: "Card Number Error")))
        } else if !isValidCVV(text: card.cvv){
            return (error: true, message: .cvv(String.localizeString(for: "Card Code Error")))
        } else if !isValidMonth(expirationMonth: card.expirationMonth) {
            return (error: true, message: .expirationMonth(String.localizeString(for: "Expiration Month Error")))
        } else if !isValidYear(expirationYear: card.expirantionYear) {
            return (error: true, message: .expirationYear(String.localizeString(for: "Expiration Year Error")))
        } else if !isValidDate(card: card) {
            return (error: true, message: .validDate(String.localizeString(for: "Expiration Date Error")))
        } else {
            return (error: false, message: .noValidationNeeded)
        }
    }
    
    private func isValidNumber(cardNumber: String) -> Bool {
        let trimedNumber = cardNumber.replacingOccurrences(of: StringConstants.whitespace, with: StringConstants.empty)
        return CardFormExceptionHandler.lengthAmericanExpress...CardFormExceptionHandler.lengthCommonCard ~= trimedNumber.count
    }
    
    private func isValidCVV(text: String) -> Bool {
        return NSPredicate(format:"SELF MATCHES %@", StringConstants.cvvPattern).evaluate(with: text)
    }
    
    private func isValidMonth(expirationMonth: String) -> Bool {
        var dateComponents = DateComponents()
        dateComponents.month = Int(expirationMonth) ?? .zero
        return dateComponents.isValidDate(in: .current)
    }
    
    private func isValidYear(expirationYear: String) -> Bool {
        var dateComponents = DateComponents()
        dateComponents.year = Int(expirationYear) ?? .zero
        return dateComponents.isValidDate(in: .current)
    }
    
    func isValidDate(card: Card) -> Bool {
        var isValid = false
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/yy"
        let dateInput = dateFormatter.date(from: "\(card.expirationMonth)/\(card.expirantionYear)")
        
        if let date = dateInput, let dateToValid = Calendar.current.date(byAdding: .month, value: 1, to: date) {
            isValid = dateToValid > Date()
        }
        return isValid
    }
}

enum CardError: Error {
    case holderName(String)
    case number(String)
    case expirationMonth(String)
    case expirationYear(String)
    case expirationDate(String)
    case validDate(String)
    case cvv(String)
    case openPay(String)
    case noValidationNeeded
}
