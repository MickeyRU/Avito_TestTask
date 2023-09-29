import UIKit

final class DetailsDescriptionCell: UITableViewCell, ReuseIdentifying {
    
    private let priceLabel = ViewsFactory.shared.createBoldLabel(ofSize: 33)
    private let titleLabel = ViewsFactory.shared.createBoldLabel(ofSize: 15)
    
    private let descriptionTitleLabel = ViewsFactory.shared.createBoldLabel(ofSize: 20)
    private let descriptionLabel = ViewsFactory.shared.createRegularLabel(ofSize: 15, color: .unBlack, numberOfLines: 0)
    
    private let sellerTitleLabel = ViewsFactory.shared.createBoldLabel(ofSize: 20)
    private let emailLabel = ViewsFactory.shared.createRegularLabel(ofSize: 15, color: .unBlack, numberOfLines: 0)
    private let phoneNumberLabel = ViewsFactory.shared.createRegularLabel(ofSize: 15, color: .unBlack, numberOfLines: 0)
    private let addressLabel = ViewsFactory.shared.createRegularLabel(ofSize: 15, color: .unBlack, numberOfLines: 0)
    private let createdAtLabel = ViewsFactory.shared.createRegularLabel(ofSize: 13, color: .unGray, numberOfLines: 0)


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ advertisement: AdvertisementDetailsCellModel) {
        self.priceLabel.text = advertisement.formattedPrice
        self.titleLabel.text = advertisement.title
        self.descriptionTitleLabel.text = "Описание"
        self.descriptionLabel.text = advertisement.description
        self.sellerTitleLabel.text = "Контакты продавца"
        self.emailLabel.text = advertisement.email
        self.phoneNumberLabel.text = advertisement.phoneNumber
        self.addressLabel.text = "\(advertisement.location), \(advertisement.address)"
        self.createdAtLabel.text = advertisement.formattedCreatedDate
    }
    
    private func setupViews() {
        [priceLabel, titleLabel, descriptionTitleLabel, descriptionLabel, sellerTitleLabel, emailLabel, phoneNumberLabel, addressLabel, createdAtLabel].forEach { contentView.addViewWithNoTAMIC($0) }
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            titleLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: priceLabel.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            descriptionTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionTitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionTitleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: descriptionTitleLabel.trailingAnchor),
            
            sellerTitleLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            sellerTitleLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            sellerTitleLabel.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: sellerTitleLabel.bottomAnchor, constant: 10),
            emailLabel.leadingAnchor.constraint(equalTo: sellerTitleLabel.leadingAnchor),
            emailLabel.trailingAnchor.constraint(equalTo: sellerTitleLabel.trailingAnchor),
            
            phoneNumberLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor),
            phoneNumberLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            phoneNumberLabel.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            
            addressLabel.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor),
            addressLabel.leadingAnchor.constraint(equalTo: phoneNumberLabel.leadingAnchor),
            addressLabel.trailingAnchor.constraint(equalTo: phoneNumberLabel.trailingAnchor),
            
            createdAtLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 20),
            createdAtLabel.leadingAnchor.constraint(equalTo: addressLabel.leadingAnchor),
            createdAtLabel.trailingAnchor.constraint(equalTo: addressLabel.trailingAnchor)
        ])
    }
}
