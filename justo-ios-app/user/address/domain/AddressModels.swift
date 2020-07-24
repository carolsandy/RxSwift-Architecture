import Foundation

struct Address {
    var id: String
    var addressName: String
    var firstName: String
    var lastName: String
    var streetAddress1: String
    var streetAddress2: String
    var city: String
    var cityArea: String
    var postalCode: String
    var country: String
    var countryCode: String
    var countryArea: String
    var phone: String
    var isDefaultShippingAddress: Bool
    var isDefaultBillingAddress: Bool
    
    init(id: String = StringConstants.empty, addressName: String = StringConstants.empty, firstName: String = StringConstants.empty, lastName: String = StringConstants.empty, streetAddress1: String = StringConstants.empty, streetAddress2: String = StringConstants.empty, city: String = StringConstants.empty, cityArea: String = StringConstants.empty, postalCode: String = StringConstants.empty, country: String = StringConstants.empty, countryCode: String = StringConstants.empty, countryArea: String = StringConstants.empty, phone: String = StringConstants.empty, isDefaultShippingAddress: Bool = BoolConstants.defaultValue, isDefaultBillingAddress: Bool = BoolConstants.defaultValue) {
        self.id = id
        self.addressName = addressName
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress1 = streetAddress1
        self.streetAddress2 = streetAddress2
        self.city = city
        self.cityArea = cityArea
        self.postalCode = postalCode
        self.country = country
        self.countryCode = countryCode
        self.countryArea = countryArea
        self.phone = phone
        self.isDefaultShippingAddress = isDefaultShippingAddress
        self.isDefaultBillingAddress = isDefaultBillingAddress
    }
}

struct AddressAddInput {
    var addressName: String
    var firstName: String
    var lastName: String
    var streetAddress1: String
    var streetAddress2: String
    var city: String
    var cityArea: String
    var postalCode: String
    var country: String
    var countryArea: String
    var phone: String
    
    init(addressName: String, firstName: String, lastName: String, streetAddress1: String, streetAddress2: String, city: String, cityArea: String, postalCode: String, country: String = .localizeString(for: "Country"), countryArea: String = .localizeString(for: "Country Area"), phone: String) {
        self.addressName = addressName
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress1 = streetAddress1
        self.streetAddress2 = streetAddress2
        self.city = city
        self.cityArea = cityArea
        self.postalCode = postalCode
        self.country = country
        self.countryArea = countryArea
        self.phone = phone
    }
}

extension AddressAddInput {
    
    func asAddressAddMutation() -> AddressAddMutation {
        let addressInput = AddressInput(addressName: self.addressName,
                                        firstName: self.firstName,
                                        lastName: self.lastName,
                                        streetAddress1: self.streetAddress1,
                                        streetAddress2: self.streetAddress2,
                                        city: self.city,
                                        cityArea: self.cityArea,
                                        postalCode: self.postalCode,
                                        country: self.country,
                                        countryArea: self.countryArea,
                                        phone: .localizeString(for: "+52%@ phone", argument: self.phone))
        
        return AddressAddMutation(input: addressInput)
    }
}
