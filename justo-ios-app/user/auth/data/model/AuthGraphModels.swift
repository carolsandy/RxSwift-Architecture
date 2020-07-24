import Foundation
import CoreData

private let JWT = "JWT "

extension SignInMutation.Data.TokenCreate {

    func asUserEntity(managedContext: NSManagedObjectContext) {
        let entity = NSEntityDescription.entity(forEntityName: "UserEntity", in: managedContext)!
        let user = NSManagedObject(entity: entity, insertInto: managedContext)
       
        user.setValue(JWT + (token ?? StringConstants.empty) , forKey: "token")
        user.setValue(self.user?.token , forKey: "uuid")
        user.setValue(self.user?.firstName, forKey: "firstName")
        user.setValue(self.user?.lastName, forKey: "lastName")
        user.setValue(self.user?.email, forKey: "email")
        user.setValue(self.user?.checkout?.id ?? StringConstants.empty, forKey: "checkoutId")
        user.setValue(self.user?.checkout?.token ?? StringConstants.empty, forKey: "checkoutToken")
        user.setValue(String(self.user?.checkout?.quantity ?? .zero), forKey: "checkoutQuantity")
    }
}

extension SignUpMutation.Data.CustomerRegister {
    
    func asUserEntity(managedContext: NSManagedObjectContext) {
         let entity = NSEntityDescription.entity(forEntityName: "UserEntity", in: managedContext)!
         let user = NSManagedObject(entity: entity, insertInto: managedContext)

         user.setValue(JWT + (token ?? StringConstants.empty) , forKey: "token")
         user.setValue(self.user?.token , forKey: "uuid")
         user.setValue(self.user?.firstName, forKey: "firstName")
         user.setValue(self.user?.lastName, forKey: "lastName")
         user.setValue(self.user?.email, forKey: "email")
         user.setValue(StringConstants.empty, forKey: "checkoutId")
         user.setValue(StringConstants.empty, forKey: "checkoutToken")
         user.setValue(StringConstants.empty, forKey: "checkoutQuantity")
     }
}

extension RecoverPasswordMutation.Data.CustomerPasswordReset {

    func asErrors() -> [String] {
        let errorMessages = self.errors?.compactMap { error in error.message }
        return errorMessages.orDefaultArray()
    }
}

extension SetNewPasswordMutation.Data.SetNewPassword {

    func asErrors() -> [String] {
        let errorMessages = self.errors?.compactMap { error in error.message }
        return errorMessages.orDefaultArray()
    }
}

struct UserMapping {
    
    static func mapUser(tokenCreate: SignInMutation.Data.TokenCreate) -> User {
        return User(token: JWT + tokenCreate.token.orDefaultString(),
                    uuid: tokenCreate.user?.token ?? StringConstants.empty,
                    email: tokenCreate.user?.email ?? StringConstants.empty,
                    firstName: tokenCreate.user?.firstName ?? StringConstants.empty,
                    lastName: tokenCreate.user?.lastName ?? StringConstants.empty,
                    userCheckout: Checkout(),
                    addresses: [Address](),
                    errors: tokenCreate.errors.compactMap { error in error?.message })
    }
    
    static func mapUser(customRegister: SignUpMutation.Data.CustomerRegister?) -> User {
        return User(token: JWT + (customRegister?.token ?? StringConstants.empty),
                    uuid: customRegister?.user?.token ?? StringConstants.empty,
                    email: customRegister?.user?.email ?? StringConstants.empty,
                    firstName: customRegister?.user?.firstName ?? StringConstants.empty,
                    lastName: customRegister?.user?.lastName ?? StringConstants.empty,
                    userCheckout: Checkout(),
                    addresses: [Address](),
                    errors: customRegister?.errors?.compactMap { error in error.message } ?? [])
    }
    
    static func mapUser(token: String, fetchProfile: FetchProfileQuery.Data.Me?) -> User {
        return User(token: token,
                    uuid: fetchProfile?.token ?? StringConstants.empty,
                    email: fetchProfile?.email ?? StringConstants.empty,
                    firstName: fetchProfile?.firstName ?? StringConstants.empty,
                    lastName: fetchProfile?.lastName ?? StringConstants.empty,
                    userCheckout: fetchProfile?.checkout?.asCheckout() ?? Checkout(),
                    addresses: MappingAddress.mapAddresses(addresses: fetchProfile?.addresses),
                    errors: [])
    }
    
    static func mapUser(token: String, updateAccount: EditAccountMutation.Data.LoggedUserUpdate?) -> User {
        return User(token: token,
                    uuid: updateAccount?.user?.token ?? StringConstants.empty,
                    email: updateAccount?.user?.email ?? StringConstants.empty,
                    firstName: updateAccount?.user?.firstName ?? StringConstants.empty,
                    lastName: updateAccount?.user?.lastName ?? StringConstants.empty,
                    userCheckout: Checkout(),
                    addresses: [Address](),
                    errors: [])
    }
}

struct MappingAddress {
    
    static func mapAddresses(addresses: [FetchProfileQuery.Data.Me.Address?]?) -> [Address] {
        let addresses = addresses?.compactMap {address in address?.asUserAddress()}
        return addresses ?? [Address]()
    }
}

extension FetchProfileQuery.Data.Me.Address {
    
    func asUserAddress() -> Address {
        return Address(id: self.id,
                       addressName: self.addressName.orDefaultString(),
                       firstName: self.firstName,
                       lastName: self.lastName,
                       streetAddress1: self.streetAddress1,
                       streetAddress2: self.streetAddress2,
                       city: self.city,
                       cityArea: self.cityArea,
                       postalCode: self.postalCode,
                       country: self.country.country,
                       countryCode: self.country.code,
                       countryArea: self.countryArea,
                       phone: self.phone.orDefaultString(),
                       isDefaultShippingAddress: self.isDefaultShippingAddress ?? false,
                       isDefaultBillingAddress: self.isDefaultBillingAddress ?? false)
    }
}
