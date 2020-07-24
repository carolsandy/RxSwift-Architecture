import Foundation
import Apollo
import RxSwift

class UserRemoteDataSource {
    
    private let apolloClientBuilder: ApolloClientBuilder
    
    init(apolloClientBuilder: ApolloClientBuilder) {
        self.apolloClientBuilder = apolloClientBuilder
    }
    
    func fetchUser(token: String) -> Observable<FetchProfileQuery.Data.Me> {
        return createApolloClientWithHeader(token: token).apolloRX.fetch(query: FetchProfileQuery()).compactMap { data in data.me }
    }
    
    func updatePassword(token: String, passwordUpdate: PasswordUpdateInput) -> Observable<[String]> {
        return createApolloClientWithHeader(token: token).apolloRX.perform(mutation: passwordUpdate.asUpdatePasswordMutation())
            .compactMap { data in data.changePassword?.asErrors() }
    }
    
    func updateUser(token: String, userUpdate: UserUpdateInput) -> Observable<User> {
        return createApolloClientWithHeader(token: token).apolloRX.perform(mutation: userUpdate.asEditAccountMutation())
            .compactMap { loggedUser in UserMapping.mapUser(token: token, updateAccount: loggedUser.loggedUserUpdate)}
    }
    
    fileprivate func createApolloClientWithHeader(token: String) -> ApolloClient {
        return apolloClientBuilder.addAuthorizationHeader(authorization: token).build()
    }
}
