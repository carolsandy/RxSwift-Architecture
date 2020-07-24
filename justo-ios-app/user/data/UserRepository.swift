import Foundation
import RxSwift

class UserRepository {
   
    private let userLocalDataSource: UserLocalDataSource
    private let userRemoteDataSource: UserRemoteDataSource
    
    init(userLocalDataSource: UserLocalDataSource, userRemoteDataSource: UserRemoteDataSource) {
        self.userLocalDataSource = userLocalDataSource
        self.userRemoteDataSource = userRemoteDataSource
    }
    
    func getUser() -> Observable<User> {
        return userLocalDataSource.get()
    }
    
    func getOrFetchUser(forceFetchUser: Bool = false) -> Observable<User> {
        return userLocalDataSource.get()
            .catchError { error in Observable.error(SessionError.authentication("User not logged in")) }
            .flatMap { user -> Observable<User> in
            (user.userCheckout.id.isEmpty || forceFetchUser) ? self.fetchUser(token: user.token) : Observable.just(user)
        }
    }

    private func fetchUser(token: String) -> Observable<User> {
        return userRemoteDataSource.fetchUser(token: token).flatMap {
            me in self.userLocalDataSource.insert(token: token, me: me).andThen(Observable.just(UserMapping.mapUser(token: token, fetchProfile: me)))
        }
    }
    
    func updateUser(token: String, userUpdate: UserUpdateInput) -> Observable<User> {
        return userRemoteDataSource.updateUser(token: token, userUpdate: userUpdate).flatMap { loggedUserUpdate in
            self.userLocalDataSource.update(editUser: loggedUserUpdate).andThen(Observable.just(loggedUserUpdate))
        }
    }
    
    func updateCheckout(checkout: Checkout) -> Completable {
        return userLocalDataSource.updateCheckout(checkout: checkout)
    }
    
    func updatePassword(token: String, passwordUpdate: PasswordUpdateInput) -> Observable<[String]> {
        return userRemoteDataSource.updatePassword(token: token, passwordUpdate: passwordUpdate)
    }
}
