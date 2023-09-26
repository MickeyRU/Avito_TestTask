import Foundation

extension DateFormatter {
    static var inputDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU") // Изменить при Локализации приложения
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    static var outputDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")  // Изменить при Локализации приложения
        formatter.dateFormat = "d MMMM"
        return formatter
    }()
}
