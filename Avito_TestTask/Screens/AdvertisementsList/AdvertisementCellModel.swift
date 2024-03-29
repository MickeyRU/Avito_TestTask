import Foundation

struct AdvertisementCellModel {
    let title: String
    let imageURL: String
    let location: String
    let formattedPrice: String
    let formattedDate: String
    
    init(advertisement: AdvertisementModel) {
        self.title = advertisement.title
        self.imageURL = advertisement.imageURL
        self.location = advertisement.location
        
        // Форматируем цену для визуального отображения как в приложении Avito
        let numericPart = advertisement.price.filter { "0"..."9" ~= $0 }
        
        if let priceNumber = Int(numericPart) {
            self.formattedPrice = NumberFormatter.formatPrice(priceNumber) + " ₽"
        } else {
            self.formattedPrice = advertisement.price
        }
        
        // Форматируем дату для визуального отображения как в приложении Avito
        self.formattedDate = DateFormatter.formatDate(advertisement.createdDate)
    }
}
