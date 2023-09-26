import UIKit

struct CollectionViewConfiguration {
    let itemSpacing: CGFloat
    let lineSpacing: CGFloat
    let sectionInsets: UIEdgeInsets
    let numberOfItemsPerRow: Int
    let totalSpacing: CFloat
    
    init(itemSpacing: CGFloat, lineSpacing: CGFloat, sectionInsets: UIEdgeInsets, numberOfItemsPerRow: Int) {
        self.itemSpacing = itemSpacing
        self.lineSpacing = lineSpacing
        self.sectionInsets = sectionInsets
        self.numberOfItemsPerRow = numberOfItemsPerRow
        self.totalSpacing = CFloat(sectionInsets.left + sectionInsets.right + (CGFloat(numberOfItemsPerRow - 1) * itemSpacing))
    }
    
    static var defaultConfiguration: CollectionViewConfiguration {
        return CollectionViewConfiguration(itemSpacing: 10,
                                           lineSpacing: 15,
                                           sectionInsets: UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15),
                                           numberOfItemsPerRow: 2)
    }
}
