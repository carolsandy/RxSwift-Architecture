import Foundation

class AnalyticsProviderFactory {

    private let segmentProvider: SegmentProvider

    init(segmentProvider: SegmentProvider) {
        self.segmentProvider = segmentProvider
    }

    func get(_ analyticsType: AnalyticsType) -> AnalyticsProvider {
        switch analyticsType {
        case .segment:
            return segmentProvider
        }
    }
}
