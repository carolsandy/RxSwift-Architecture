import Foundation

class OpenPaySDK {
    
    static let shared = OpenPaySDK(openpay: Openpay(merchantId: BuildConfig.openpayMerchantId,
                                                    apyKey: BuildConfig.openpayApiKey,
                                                    isProductionMode: !BuildConfig.isDebug,
                                                    isDebug: BuildConfig.isDebug))
    private let openpay: Openpay
    
    init(openpay: Openpay) {
        self.openpay = openpay
    }
    
    func createToken(opCard: OPCard, openPaySuccess: @escaping (OPToken) -> (), openPayFailure: @escaping (Error) -> ()) {
        openpay.createToken(with: opCard, success: { opToken in
            guard let opToken = opToken else { return }
            openPaySuccess(opToken)
        }, failure: { error in
            guard let error = error else { return }
            openPayFailure(error)
        })
    }
    
    func createDeviceSessionId() -> String?  {
        return openpay.createDeviceSessionId()
    }
 }
