import Foundation

struct AdvertisementCellModel {
    let title: String
    let imageUrl: String
    let location: String
    let formattedPrice: String
    let formattedDate: String
    
    init(advertisement: AdvertisementModel) {
        self.title = advertisement.title
        self.imageUrl = advertisement.imageURL
        
        // Форматируем цену для визуального отображения как в приложении Avito
        let numericPart = advertisement.price.filter { "0"..."9" ~= $0 }
        
        if let priceNumber = Int(numericPart),
           let formattedNumericPart = NumberFormatter.defaultPriceFormatter.string(from: NSNumber(value: priceNumber)) {
            self.formattedPrice = "\(formattedNumericPart) ₽"
        } else {
            self.formattedPrice = advertisement.price
        }
        
        self.location = advertisement.location
        
        // Форматируем дату для визуального отображения как в приложении Avito
        if let date = DateFormatter.inputDateFormatter.date(from: advertisement.createdDate) {
            self.formattedDate = DateFormatter.outputDateFormatter.string(from: date)
        } else {
            self.formattedDate = advertisement.createdDate
        }
    }
}
