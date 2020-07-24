import Foundation
import RxSwift

class AnalyticsRepository {

    private let analyticsRemoteDataSource: AnalyticsRemoteDataSource

    init(analyticsRemoteDataSource: AnalyticsRemoteDataSource) {
        self.analyticsRemoteDataSource = analyticsRemoteDataSource
    }

    func trackEvent(eventName: String, properties: [String: Any]) -> Completable {
        return analyticsRemoteDataSource.trackEvent(eventName: eventName, properties: properties)
    }
}
