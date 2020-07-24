import Foundation
import CoreData
import RxSwift
import Apollo

class AuthLocalDataSource {
 
    private let managedContext: NSManagedObjectContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserEntity")
    
    init(managedContext: NSManagedObjectContext) {
        self.managedContext = managedContext
    }
    
    func clear() -> Completable {
        return Completable.create { completable in
            do {
                let userEntityList = try self.managedContext.fetch(self.fetchRequest) as! [UserEntity]
                userEntityList.forEach { userEntity in self.managedContext.delete(userEntity) }
                try self.managedContext.save()
            } catch let e as NSError {
                completable(.error(e))
            }
            completable(.completed)
            return Disposables.create {}
        }
        
    }

    func insert(graphQLSelectionSet: GraphQLSelectionSet) -> Completable {
        return Completable.create { completable in
            do {
                if graphQLSelectionSet is SignInMutation.Data.TokenCreate {
                    let tokenCreate = graphQLSelectionSet as? SignInMutation.Data.TokenCreate
                    tokenCreate?.asUserEntity(managedContext: self.managedContext)
                } else {
                    let customerRegister = graphQLSelectionSet as? SignUpMutation.Data.CustomerRegister
                    customerRegister?.asUserEntity(managedContext: self.managedContext)
                }
                try self.managedContext.save()
            } catch let e as NSError {
                completable(.error(e))
            }

            completable(.completed)
            return Disposables.create {}
        }
    }
}
