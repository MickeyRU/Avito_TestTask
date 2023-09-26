import UIKit

final class ViewsFactory {
    static let shared = ViewsFactory()
    
    func createImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
    
    func createTextTitleLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.sfRegular15
        label.textColor = UIColor.unBlack
        return label
    }
    
    func createTextPriceLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.sfBold17
        label.textColor = UIColor.unBlack
        return label
        
    }
    
    func createTextDescriptionLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.sfRegular13
        label.textColor = UIColor.unGray
        return label
    }
}
