import UIKit

final class MainNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        let vc = AdvertisementsListViewController(viewModel: AdvertisementsListViewModel())
        viewControllers = [vc]
    }
}
