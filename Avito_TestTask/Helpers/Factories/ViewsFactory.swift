import UIKit

final class ViewsFactory {
    static let shared = ViewsFactory()
    
    func createImageView(cornerRadius: CGFloat) -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = cornerRadius
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }

    func createBoldLabel(ofSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.font = UIFont.makeBoldFont(ofSize: ofSize)
        label.textColor = UIColor.unBlack
        return label
    }
    
    func createRegularLabel(ofSize: CGFloat,  color: UIColor, numberOfLines: Int) -> UILabel {
        let label = UILabel()
        label.font = UIFont.makeRegularFont(ofSize: ofSize)
        label.numberOfLines = numberOfLines
        label.textColor = color
        return label
    }
}
