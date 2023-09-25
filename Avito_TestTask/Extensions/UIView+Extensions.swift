import UIKit

extension UIView {
    func addViewWithNoTAMIC(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
}
