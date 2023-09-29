import UIKit
import Kingfisher

final class DetailsImageCell: UITableViewCell, ReuseIdentifying {
    private let advertisementImageView = ViewsFactory.shared.createImageView(cornerRadius: 0)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ advertisement: AdvertisementDetailsCellModel) {
        self.advertisementImageView.kf.indicatorType = .activity
        self.advertisementImageView.kf.setImage(with: URL(string: advertisement.imageURL), placeholder: UIImage.emptyPhotoImage)
    }
    
    private func setupViews() {
        contentView.backgroundColor = UIColor.unWhite

        contentView.addViewWithNoTAMIC(advertisementImageView)
        
        NSLayoutConstraint.activate([
            advertisementImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            advertisementImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            advertisementImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            advertisementImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
