import Foundation

class AnalyticsEventsProvider {

    private let analyticsEventDictionary: [String: AnalyticsEvent] =
            [
                AnalyticsEvents.SIGN_UP_COMPLETE_EVENT:
                AnalyticsEvent(name: AnalyticsEvents.SIGN_UP_COMPLETE_EVENT, analyticsTypeProviders: [AnalyticsType.segment]),
                AnalyticsEvents.SHOPPING_CART_VIEW:
                AnalyticsEvent(name: AnalyticsEvents.SHOPPING_CART_VIEW, analyticsTypeProviders: [AnalyticsType.segment]),
                AnalyticsEvents.CHECKOUT_STARTED_EVENT:
                AnalyticsEvent(name: AnalyticsEvents.CHECKOUT_STARTED_EVENT, analyticsTypeProviders: [AnalyticsType.segment]),
                AnalyticsEvents.ORDER_COMPLETE_EVENT:
                AnalyticsEvent(name: AnalyticsEvents.ORDER_COMPLETE_EVENT, analyticsTypeProviders: [AnalyticsType.segment])
            ]

    func findEvent(eventName: String) -> AnalyticsEvent? {
        return analyticsEventDictionary[eventName]
    }
}
