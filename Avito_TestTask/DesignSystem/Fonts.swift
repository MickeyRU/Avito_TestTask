import UIKit

extension UIFont {
   static func makeBoldFont (ofSize: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: ofSize, weight: .bold)
    }
    
    static func makeRegularFont (ofSize: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: ofSize, weight: .regular)
    }
}
