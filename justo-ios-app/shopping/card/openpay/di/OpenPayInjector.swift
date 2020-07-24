import Foundation

class OpenPayInjector {
    
    fileprivate func provideOpenPaySDK() -> OpenPaySDK {
        return OpenPaySDK.shared
    }
    
    fileprivate func provideOpenPayRemoteDataSource() -> OpenPayRemoteDataSource {
        return OpenPayRemoteDataSource(openPaySDK: provideOpenPaySDK())
    }
    
    func provideOpenPayRepository() -> OpenPayRepository {
        return OpenPayRepository(openPayRemoteDataSource: provideOpenPayRemoteDataSource())
    }
    
    func provideCreateOpenPayPaymentUseCase() -> CreateOpenPayPaymentUseCase {
        return CreateOpenPayPaymentUseCase(openPayRepository: provideOpenPayRepository())
    }
}
