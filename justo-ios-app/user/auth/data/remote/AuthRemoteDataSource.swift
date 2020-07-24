import Foundation
import Apollo
import RxSwift

class AuthRemoteDataSource {

    private let apolloClient: ApolloClient
    private let apolloClientBuilder: ApolloClientBuilder

    init(apolloClient: ApolloClient, apolloClientBuilder: ApolloClientBuilder) {
        self.apolloClient = apolloClient
        self.apolloClientBuilder = apolloClientBuilder
    }

    func signIn(userCredentials: UserCredentials) -> Observable<SignInMutation.Data.TokenCreate> {
        return apolloClient.apolloRX.perform(mutation: userCredentials.asSignInRequest())
            .compactMap { data in data.tokenCreate }
    }

    func signUp(userRegister: UserRegister) -> Observable<SignUpMutation.Data.CustomerRegister> {
        return apolloClient.apolloRX.perform(mutation: userRegister.asSignUpRequest())
            .compactMap { data in data.customerRegister }
    }
    
    func recoverPassword(recoverPassword: RecoverPassword) -> Observable<[String]> {
        return apolloClient.apolloRX.perform(mutation: recoverPassword.asRecoverAccountRequest())
            .compactMap { data in data.customerPasswordReset?.asErrors() }
    }

    func setNewPassword(newPassword: NewPassword) -> Observable<[String]> {
        return apolloClient.apolloRX.perform(mutation: newPassword.asSetNewPasswordRequest())
            .compactMap { data in data.setNewPassword?.asErrors() }
    }
    
    func closeSession(token: String) -> Completable {
        return apolloClientBuilder.createApolloClientWith(token: token).apolloRX.perform(mutation: TokenLogoutMutation())
            .ignoreElements()
    }

}
