import Foundation

class SegmentProvider: AnalyticsProvider {

    private let segmentSDK: SegmentSDK

    init(segmentSDK: SegmentSDK) {
        self.segmentSDK = segmentSDK
    }

    func trackEvent(event: String, properties: [String: Any]?) {
        segmentSDK.track(event: event, properties: properties)
    }
}
