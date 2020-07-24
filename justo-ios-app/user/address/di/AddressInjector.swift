import Foundation

class AddressInjector {
    
    fileprivate func provideApolloClientBuilder() -> ApolloClientBuilder {
        return ApolloClientBuilder()
    }
    
    fileprivate func provideAddressRemoteDataSource() -> AddressRemoteDataSource {
        return AddressRemoteDataSource(apolloClientBuilder: provideApolloClientBuilder())
    }
    
    fileprivate func provideAddressRepository() -> AddressRepository {
        return AddressRepository(addressRemoteDataSource: provideAddressRemoteDataSource())
    }
    
    func provideAddAddressUseCase() -> AddAddressUseCase {
        return AddAddressUseCase(userRepository: UserInjector().provideUserRepository(), addressRepository: provideAddressRepository())
    }
}
