import Foundation
import RxSwift

class AuthRepository {

    private let authRemoteDataSource: AuthRemoteDataSource
    private let authLocalDataSource: AuthLocalDataSource

    init(authLocalDataSource: AuthLocalDataSource, authRemoteDataSource: AuthRemoteDataSource) {
        self.authRemoteDataSource = authRemoteDataSource
        self.authLocalDataSource = authLocalDataSource
    }

    func signIn(userCredentials: UserCredentials) -> Observable<User> {
        return authRemoteDataSource.signIn(userCredentials: userCredentials).flatMap { tokenCreate in
            return (tokenCreate.errors.isEmpty)
                ? self.authLocalDataSource.insert(graphQLSelectionSet: tokenCreate)
                    .andThen(Observable.just(UserMapping.mapUser(tokenCreate: tokenCreate)))
                : Observable.just(UserMapping.mapUser(tokenCreate: tokenCreate))
        }
    }
    
    func signUp(userRegister: UserRegister) -> Observable<User> {
        return authRemoteDataSource.signUp(userRegister: userRegister).flatMap { customerRegister in
            return (customerRegister.errors?.isEmpty ?? false)
                ? self.authLocalDataSource.insert(graphQLSelectionSet: customerRegister)
                    .andThen(Observable.just(UserMapping.mapUser(customRegister: customerRegister)))
                : Observable.just(UserMapping.mapUser(customRegister: customerRegister) )
        }
    }

    func recoverPassword(recoverPassword: RecoverPassword) -> Observable<[String]> {
        return authRemoteDataSource.recoverPassword(recoverPassword: recoverPassword)
    }

    func setNewPassword(newPassword: NewPassword) -> Observable<[String]> {
        return authRemoteDataSource.setNewPassword(newPassword: newPassword)
    }
    
    func closeSession(jwtToken: String) -> Completable {
        return authRemoteDataSource.closeSession(token: jwtToken).andThen(authLocalDataSource.clear())
    }
}
