import UIKit

final class AdvertisementDetailsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.unWhite
        
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        setupCustomBackButton()
    }
}
