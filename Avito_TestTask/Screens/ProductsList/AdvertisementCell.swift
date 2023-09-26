import UIKit

final class AdvertisementCell: UICollectionViewCell {
    static let reuseIdentifier = "AdvertisementCell"
    
    private let ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.unBlack
        label.font = UIFont.sfRegular15
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.unBlack
        label.font = UIFont.sfBold17
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.sfRegular13
        label.textColor = UIColor.unGray
        return label
    }()
    
    private let createdAtLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.sfRegular13
        label.textColor = UIColor.unGray
        return label
    }()
    
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
            titleLabel.widthAnchor.constraint(equalTo: ImageView.widthAnchor, multiplier: 0.6),
            
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
