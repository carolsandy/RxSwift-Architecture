import Foundation

extension DateFormatter {
    
    static func formatDate(with stringDate: String) -> String {
        let parser = DateFormatter()
        let formatter = DateFormatter()
        parser.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        parser.timeZone = TimeZone.current
        formatter.dateFormat = "EEEE dd '\(String.localizeString(for: "Date Combine"))' MMMM, hh:mm a"
        formatter.locale = Locale(identifier: "es_MX")
        guard let date = parser.date(from: stringDate) else { return StringConstants.empty }
        return formatter.string(from: date)
    }
}
