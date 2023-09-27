import UIKit

final class ViewControllerFactory {
    func makeDetailViewController(with advertisementID: String) -> AdvertisementDetailsViewController {
        let controller = AdvertisementDetailsViewController(viewModel: AdvertisementDetailsViewModel(advertisementID: advertisementID))
        return controller
    }
}
