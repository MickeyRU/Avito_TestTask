import Foundation

extension DateFormatter {
    static var inputDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd" // Здесь укажите формат входной даты
        return formatter
    }()
    
    static var outputDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "d MMMM" // "14 августа"
        return formatter
    }()
}
