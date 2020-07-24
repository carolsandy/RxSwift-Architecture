import Foundation
import CoreData
import RxSwift

class UserLocalDataSource {
    
    private let managedContext: NSManagedObjectContext
    
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserEntity")
    
    init(managedContext: NSManagedObjectContext) {
        self.managedContext = managedContext
    }
    
    func insert(token: String, me: FetchProfileQuery.Data.Me) -> Completable {
        return Completable.create { completable in
            do {
                me.asUserEntity(token: token, managedContext: self.managedContext)
                try self.managedContext.save()
            } catch let e as NSError {
                completable(.error(e))
            }
            completable(.completed)
            return Disposables.create {}
        }
    }
    
    func get() -> Observable<User> {
        return Observable.create { observer in
            do {
               let data = try self.managedContext.fetch(self.fetchRequest) as! [NSManagedObject]
                let users = data.compactMap {  user in self.mapUser(userEntity: user) }
                if let loggedUser = users.first {
                    observer.onNext(loggedUser)
                    observer.onCompleted()
                } else {
                    let e = NSError.init(domain: "", code: 1, userInfo: nil)
                    observer.onError(e)
                }
            } catch let e as NSError {
                observer.onError(e)
            }
            return Disposables.create {}
        }
    }
    
    func update(editUser: User) -> Completable {
        return Completable.create { completable in
            do {
                let userEntityList = try self.managedContext.fetch(self.fetchRequest) as! [UserEntity]
                userEntityList.forEach { userEntity in
                        userEntity.setValue(editUser.firstName, forKey: "firstName")
                        userEntity.setValue(editUser.lastName, forKey: "lastName") }
                try self.managedContext.save()
            } catch let e as NSError {
                completable(.error(e))
            }
            completable(.completed)
            return Disposables.create {}
        }
    }
    
    func updateCheckout(checkout: Checkout) -> Completable {
        return Completable.create { completable in
            do {
                let userEntityList = try self.managedContext.fetch(self.fetchRequest) as! [UserEntity]
                userEntityList.forEach { userEntity in
                    userEntity.setValue(checkout.id, forKey: "checkoutId")
                    userEntity.setValue(String(checkout.quantity), forKey: "checkoutQuantity")
                    userEntity.setValue(checkout.token, forKey: "checkoutToken") }
                try self.managedContext.save()
            } catch let e as NSError {
                completable(.error(e))
            }
            completable(.completed)
            return Disposables.create {}
        }
    }
    
    func mapUser(userEntity: NSManagedObject) -> User {
        return User(token: userEntity.getString(key: "token"),
                    uuid: userEntity.getString(key: "uuid"),
                    email: userEntity.getString(key: "email"),
                    firstName: userEntity.getString(key: "firstName"),
                    lastName: userEntity.getString(key: "lastName"),
                    userCheckout: Checkout(id: userEntity.getString(key: "checkoutId"),
                                           token: userEntity.getString(key: "checkoutToken"),
                                           quantity: userEntity.getString(key: "checkoutQuantity")),
                    addresses: [],
                    errors: [])
    }
}
