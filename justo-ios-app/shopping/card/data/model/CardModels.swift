import Foundation

struct Card {
    var name: String
    var number: String
    var expirationMonth: String
    var expirantionYear: String
    var cvv: String
    var shouldSave: Bool
}

struct SavedCard {
    let id: String
    let brand: String
    let expMonth: String
    let expYear: String
    let lastDigits: String
    let isDefault: Bool
    let isSaved: Bool
    let shouldSave: Bool
    
    init(id: String = StringConstants.empty,
         brand: String = StringConstants.empty,
         expMonth: String = StringConstants.empty,
         expYear: String = StringConstants.empty,
         lastDigits: String = StringConstants.empty,
         isDefault: Bool = false,
         isSaved: Bool = false,
         shouldSave: Bool = false) {
        self.id = id
        self.brand = brand
        self.expMonth = expMonth
        self.expYear = expYear
        self.lastDigits = lastDigits
        self.isDefault = isDefault
        self.isSaved = isSaved
        self.shouldSave = shouldSave
    }
}

extension Card {
    func asOPCard() -> OPCard {
        let opCard = OPCard()
        opCard.holderName = name
        opCard.number = number
        opCard.expirationMonth = expirationMonth
        opCard.expirationYear = expirantionYear
        opCard.cvv2 = cvv
        return opCard
    }
}

extension FetchPaymentMethodsQuery.Data.Me.SavedCard {
    func asCards() -> [SavedCard] {
        return self.edges.compactMap { savedCard in savedCard.node.asCard() }
    }
}

extension FetchPaymentMethodsQuery.Data.Me.SavedCard.Edge.Node {
    func asCard() -> SavedCard {
        return SavedCard(id: self.id,
                         brand: self.brand,
                         expMonth: self.expirationMonth,
                         expYear: self.expirationYear,
                         lastDigits: self.lastDigits,
                         isDefault: self.isDefault,
                         isSaved: true)
    }
}
