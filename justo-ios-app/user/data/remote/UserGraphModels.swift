import Foundation
import CoreData

extension FetchProfileQuery.Data.Me.Checkout {
    
    func asCheckout() -> Checkout {
        return Checkout(id: self.id, token: self.token, quantity: String(self.quantity), checkoutLines: self.lines?.compactMap { line in line?.asLine() } ?? [], total: self.totalPrice?.gross.amount ?? DoubleConstants.defaultDouble, subtotal: self.subtotalPrice?.gross.amount ?? DoubleConstants.defaultDouble, totalPrice: self.totalPrice?.gross.amount.description ?? StringConstants.empty)
    }
}

extension FetchProfileQuery.Data.Me.Checkout.Line {
    func asLine() -> CheckoutLine {
        return CheckoutLine(quantity: self.quantity,
                            totalPrice: self.totalPrice?.gross.amount ?? .zero,
                    checkoutVariant: self.variant.asVariant())
    }
}

extension FetchProfileQuery.Data.Me.Checkout.Line.Variant {
    func asVariant() -> CheckoutVariant {
        return CheckoutVariant(id: self.id,
                               productName: self.product.name,
                               productImageUrl: self.product.thumbnail?.url ?? StringConstants.empty,
                               name: self.name,
                               price: self.pricing?.price?.gross.amount ?? .zero,
                               weight: self.product.weight?.value ?? DoubleConstants.defaultDouble)
    }
}

extension FetchProfileQuery.Data.Me {

    func asUserEntity(token: String, managedContext: NSManagedObjectContext) {
        let entity = NSEntityDescription.entity(forEntityName: "UserEntity", in: managedContext)!
        let user = NSManagedObject(entity: entity, insertInto: managedContext)
        user.setValue(token, forKey: "token")
        user.setValue(self.token, forKey: "uuid")
        user.setValue(self.firstName, forKey: "firstName")
        user.setValue(self.lastName, forKey: "lastName")
        user.setValue(self.email, forKey: "email")
        user.setValue(self.checkout?.id ?? StringConstants.empty, forKey: "checkoutId")
        user.setValue(self.checkout?.token ?? StringConstants.empty, forKey: "checkoutToken")
        user.setValue(String(self.checkout?.quantity ?? .zero ), forKey: "checkoutQuantity")
    }
}

extension UpdatePasswordMutation.Data.ChangePassword {
    func asErrors() -> [String] {
        let errorMessages = self.errors?.compactMap { error in error.message }
        return errorMessages.orDefaultArray()
    }
}
