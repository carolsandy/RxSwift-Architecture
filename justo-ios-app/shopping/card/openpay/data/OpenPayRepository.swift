import Foundation
import RxSwift

class OpenPayRepository {
    
    private let openPayRemoteDataSource: OpenPayRemoteDataSource
    
    init(openPayRemoteDataSource: OpenPayRemoteDataSource) {
        self.openPayRemoteDataSource = openPayRemoteDataSource
    }
    
    func createOpenPayPayment(card: Card) -> Observable<OpenPayPayment> {
        return openPayRemoteDataSource.createToken(opCard: card.asOPCard()).map { opToken in
            OpenPayPayment(openPayToken: opToken.asOpenPayToken())
        }
    }
    
    func createDeviceSessionId() -> Observable<String> {
        return openPayRemoteDataSource.createDeviceSessionId()
    }
}
