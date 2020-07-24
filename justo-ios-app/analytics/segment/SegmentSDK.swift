import Foundation

class SegmentSDK {

    private let nameTrait = "name"
    private let emailTrait = "email"

    static let shared = SegmentSDK()

    func start() {
        let segAnalyticsConfiguration = SEGAnalyticsConfiguration(writeKey: BuildConfig.segmentWriteKey)
        segAnalyticsConfiguration.use(SEGAppsFlyerIntegrationFactory())
        segAnalyticsConfiguration.trackApplicationLifecycleEvents = true
        segAnalyticsConfiguration.trackAttributionData = true
        segAnalyticsConfiguration.flushAt = 1
        SEGAnalytics.debug(BuildConfig.isDebug)
        SEGAnalytics.setup(with: segAnalyticsConfiguration)
    }

    func track(event: String, properties: [String: Any]?) {
        SEGAnalytics.shared()?.track(event, properties: properties)
    }

    func identity(userId: String, userName: String, userEmail: String) {
        SEGAnalytics.shared()?.identify(userId, traits: [nameTrait: userName, emailTrait: userEmail])
    }
}
