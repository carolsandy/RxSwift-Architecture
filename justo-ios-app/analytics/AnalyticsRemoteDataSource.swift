import Foundation
import RxSwift

class AnalyticsRemoteDataSource {

    private let analyticsEventsProvider: AnalyticsEventsProvider
    private let analyticsProviderFactory: AnalyticsProviderFactory

    init(analyticsEventsProvider: AnalyticsEventsProvider, analyticsProviderFactory: AnalyticsProviderFactory) {
        self.analyticsEventsProvider = analyticsEventsProvider
        self.analyticsProviderFactory = analyticsProviderFactory
    }

    func trackEvent(eventName: String, properties: [String: Any]) -> Completable {
        return Completable.create { completable in
            if let analyticsEvent = self.analyticsEventsProvider.findEvent(eventName: eventName) {
                analyticsEvent.analyticsTypeProviders.forEach { analyticsType in
                    let analyticsProvider = self.analyticsProviderFactory.get(analyticsType)
                    analyticsProvider.trackEvent(event: eventName, properties: properties)
                }
                completable(.completed)
            } else {
                completable(.error(AnalyticsError.notFoundEvent("The event is not declared in analyticsEventDictionary")))
            }
            return Disposables.create()
        }
    }
}

enum AnalyticsError: Error {
    case notFoundEvent(String)
}
