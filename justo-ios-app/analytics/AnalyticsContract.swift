import Foundation

protocol AnalyticsProvider {
    func trackEvent(event: String, properties: [String: Any]?)
}

enum AnalyticsType {
    case segment
}
