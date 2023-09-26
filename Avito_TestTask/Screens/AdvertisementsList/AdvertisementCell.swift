import UIKit
import Kingfisher

final class AdvertisementCell: UICollectionViewCell, ReuseIdentifying {    
    private let imageView = ViewsFactory.shared.createImageView(cornerRadius: 10)
    private let titleLabel = ViewsFactory.shared.createTextTitleLabel()
    private let priceLabel = ViewsFactory.shared.createTextPriceLabel()
    private let locationLabel = ViewsFactory.shared.createTextDescriptionLabel()
    private let createdAtLabel = ViewsFactory.shared.createTextDescriptionLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ model: AdvertisementCellModel) {
        self.imageView.kf.indicatorType = .activity
        self.imageView.kf.setImage(with: URL(string: model.imageUrl))
        self.titleLabel.text = model.title
        self.priceLabel.text = model.formattedPrice
        self.locationLabel.text = model.location
        self.createdAtLabel.text = model.formattedDate
    }
    
    private func setupViews() {
        [imageView, titleLabel, priceLabel, locationLabel, createdAtLabel].forEach { contentView.addViewWithNoTAMIC($0) }
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            priceLabel.widthAnchor.constraint(equalTo: titleLabel.widthAnchor),
            
            locationLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5),
            locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            
            createdAtLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 5),
            createdAtLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            createdAtLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor)
        ])
    }
}
