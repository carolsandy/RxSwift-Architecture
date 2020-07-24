import Foundation

extension FetchDeliveryDatesQuery.Data.DeliverySlot {
    
    func asDeliveryDates() -> [DeliveryDay] {
        return nextDay?.compactMap { nextDay in nextDay?.asDeliveryDay() } ?? []
    }
}
extension FetchDeliveryDatesQuery.Data.DeliverySlot.NextDay {
    
    fileprivate func asDeliveryDay() -> DeliveryDay {
        return DeliveryDay(year: year.orDefaultString(),
                           month: month.orDefaultString(),
                           weekday: weekDay.orDefaultString(),
                           day: day ?? .zero,
                           hours: hours?.compactMap { hour in hour?.asDeliverHour() } ?? [])
    }
}

extension FetchDeliveryDatesQuery.Data.DeliverySlot.NextDay.Hour {
    
    fileprivate func asDeliverHour() -> DeliveryHour {
        return DeliveryHour(slot: slot.orDefaultString(), startInterval: startInterval.orDefaultString(), endInterval: endInterval.orDefaultString())
    }
}
