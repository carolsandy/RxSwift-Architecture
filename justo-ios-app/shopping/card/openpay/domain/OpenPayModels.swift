import Foundation

private let LAST_4_DIGITS = 4

struct OpenPayToken {
    var id: String
    var brand: String
    var lastDigits: String
    
    init(id: String = StringConstants.empty, brand: String = StringConstants.empty, lastDigits: String = StringConstants.empty) {
        self.id = id
        self.brand = brand
        self.lastDigits = lastDigits
    }
}

class OpenPayPayment {
    var openPayToken: OpenPayToken
    var shouldSave: Bool
    
    init(openPayToken: OpenPayToken = OpenPayToken(), shouldSave: Bool = false) {
        self.openPayToken = openPayToken
        self.shouldSave = shouldSave
    }
}

extension OPToken {
    
    func asOpenPayToken() -> OpenPayToken {
        return OpenPayToken(id: id ?? StringConstants.empty,
                            brand: card.brand ?? StringConstants.empty,
                            lastDigits: String(card.number.dropFirst(card.number.count - LAST_4_DIGITS)))
    }
}
