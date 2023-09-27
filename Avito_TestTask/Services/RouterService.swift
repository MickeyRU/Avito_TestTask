import UIKit

protocol RouterServiceProtocol {
    func routeToEditingViewController(with advertisementID: String)
}

class RouterService: RouterServiceProtocol {
    private let factory = ViewControllerFactory()
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func routeToEditingViewController(with advertisementID: String) {
        let destinationVC = factory.makeDetailViewController(with: advertisementID)
        pushController(destinationVC)
    }
    
    private func pushController(_ controller: UIViewController) {
        controller.hidesBottomBarWhenPushed = true
        viewController?.navigationController?.pushViewController(controller, animated: true)
    }
}
