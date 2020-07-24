import Foundation

struct DeliveryDay {
    var year: String
    var month: String
    var weekday: String
    var day: Int
    var hours: [DeliveryHour]
}

struct DeliveryHour {
    var slot: String
    var startInterval: String
    var endInterval: String
}
