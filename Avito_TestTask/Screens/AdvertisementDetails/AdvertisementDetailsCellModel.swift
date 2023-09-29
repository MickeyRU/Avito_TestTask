import Foundation

struct AdvertisementDetailsCellModel {
    let title: String
    let formattedPrice: String
    let location: String
    let imageURL: String
    let formattedCreatedDate: String
    let description: String
    let email: String
    let phoneNumber: String
    let address: String
    
    init(advertisement: AdvertisementDetailsModel) {
        self.title = advertisement.title
        self.imageURL = advertisement.imageURL
        self.location = advertisement.location
        self.description = advertisement.description
        self.email = advertisement.email
        self.phoneNumber = advertisement.phoneNumber
        self.address = advertisement.address
        
        // Форматируем цену для визуального отображения как в приложении Avito
        let numericPart = advertisement.price.filter { "0"..."9" ~= $0 }
        
        if let priceNumber = Int(numericPart) {
            self.formattedPrice = NumberFormatter.formatPrice(priceNumber) + " ₽"
        } else {
            self.formattedPrice = advertisement.price
        }
        
        // Форматируем дату для визуального отображения как в приложении Avito
        self.formattedCreatedDate = DateFormatter.formatDate(advertisement.createdDate)
    }
}
