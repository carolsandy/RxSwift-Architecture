import Foundation
import Apollo
import RxSwift

class AddressRemoteDataSource {
    
    private let apolloClientBuilder: ApolloClientBuilder
    
    init(apolloClientBuilder: ApolloClientBuilder) {
        self.apolloClientBuilder = apolloClientBuilder
    }
    
    func addAddress(token: String, addressAddMutation: AddressAddMutation) -> Observable<[String]> {
        return createApolloClientWithHeader(token: token).apolloRX.perform(mutation: addressAddMutation)
            .compactMap { loggedUser in loggedUser.addressCreate?.asErrors() }
    }
    
    fileprivate func createApolloClientWithHeader(token: String) -> ApolloClient {
        return apolloClientBuilder.addAuthorizationHeader(authorization: token).build()
    }
    
}
