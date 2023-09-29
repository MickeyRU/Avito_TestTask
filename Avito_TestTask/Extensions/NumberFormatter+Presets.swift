import Foundation

extension NumberFormatter {
    static var defaultPriceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        return formatter
    }()
    
    static func formatPrice(_ price: Int) -> String {
        let number = NSNumber(value: price)
        return defaultPriceFormatter.string(from: number) ?? "\(price)"
    }
}
