import Foundation

class BuildConfig {
   
    private static let DEBUG = "debug"
    static let isDebug = (Bundle.main.infoDictionary?["ENVIRONMENT"] as? String).orDefaultString() == DEBUG
    static let justoApiUrl = (Bundle.main.infoDictionary?["API_URL"] as? String).orDefaultString()
    static let openpayMerchantId = (Bundle.main.infoDictionary?["OPEN_PAY_MERCHANT_ID"] as? String).orDefaultString()
    static let openpayApiKey = (Bundle.main.infoDictionary?["OPEN_PAY_PUBLIC_KEY"] as? String).orDefaultString()
    static let segmentWriteKey = (Bundle.main.infoDictionary?["SEGMENT_WRITE_KEY"] as? String).orDefaultString()
}
