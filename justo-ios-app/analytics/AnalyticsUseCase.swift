import Foundation
import RxSwift

class AnalyticsUseCase {

    private let analyticsRepository: AnalyticsRepository

    init(analyticsRepository: AnalyticsRepository) {
        self.analyticsRepository = analyticsRepository
    }

    func trackEvent(eventName: String, properties: [String: Any] = [:]) -> Completable {
        return analyticsRepository.trackEvent(eventName: eventName, properties: properties)
    }
}
