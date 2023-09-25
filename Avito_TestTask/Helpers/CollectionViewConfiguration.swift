import UIKit

struct CollectionViewConfiguration {
    let itemSpacing: CGFloat
    let lineSpacing: CGFloat
    let sectionInsets: UIEdgeInsets
    let numberOfItemsPerRow: Int
    
    static var defaultConfiguration: CollectionViewConfiguration {
        return CollectionViewConfiguration(itemSpacing: 10,
                                           lineSpacing: 15,
                                           sectionInsets: UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15),
                                           numberOfItemsPerRow: 2)
    }
}
