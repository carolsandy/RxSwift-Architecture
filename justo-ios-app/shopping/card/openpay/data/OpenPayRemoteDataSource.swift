import Foundation
import RxSwift

class OpenPayRemoteDataSource {
  
    private let openPaySDK: OpenPaySDK
    
    init(openPaySDK: OpenPaySDK) {
        self.openPaySDK = openPaySDK
    }
    
    func createToken(opCard: OPCard) -> Observable<OPToken> {
        return Observable.create { observer in
            self.openPaySDK.createToken(opCard: opCard, openPaySuccess: { opToken in
                observer.onNext(opToken)
                observer.onCompleted()
            }, openPayFailure: { error in
                observer.onError(error)
            })
            return Disposables.create()
        }
    }
    
    func createDeviceSessionId() -> Observable<String> {
        return Observable.create { observer in
            if let deviceSessionId = UIDevice.current.identifierForVendor?.uuidString.replacingOccurrences(of: StringConstants.dash, with: StringConstants.empty) {
                observer.onNext(deviceSessionId)
                observer.onCompleted()
            } else {
                observer.onError(OpenPaySDKError.deviceSessionId("Error generating deviceSessionId"))
            }
            return Disposables.create()
        }
    }
}

enum OpenPaySDKError: Error {
    case deviceSessionId(String)
}
