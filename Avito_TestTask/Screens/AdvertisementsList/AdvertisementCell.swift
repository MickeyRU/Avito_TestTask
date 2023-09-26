import UIKit

final class AdvertisementCell: UICollectionViewCell {
    static let reuseIdentifier = "AdvertisementCell"
    
    private let ImageView = ViewsFactory.shared.createImageView()
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
    
    func configure(_ advertisement: AdvertisementModel) {
        self.ImageView.image = UIImage(named: "mock1")
        self.titleLabel.text = advertisement.title
        self.priceLabel.text = advertisement.price
        self.locationLabel.text = advertisement.location
        self.createdAtLabel.text = advertisement.createdDate
    }
    
    private func setupViews() {
        [ImageView, titleLabel, priceLabel, locationLabel, createdAtLabel].forEach { contentView.addViewWithNoTAMIC($0) }
        
        NSLayoutConstraint.activate([
            ImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            ImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            ImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ImageView.heightAnchor.constraint(equalTo: ImageView.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: ImageView.bottomAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            priceLabel.widthAnchor.constraint(equalTo: titleLabel.widthAnchor),
            
            locationLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5),
            locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: ImageView.trailingAnchor),
            
            createdAtLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor),
            createdAtLabel.leadingAnchor.constraint(equalTo: ImageView.leadingAnchor),
            createdAtLabel.trailingAnchor.constraint(equalTo: ImageView.trailingAnchor)
        ])
    }
}
