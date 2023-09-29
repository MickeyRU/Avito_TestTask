import Foundation

protocol AdvertisementDetailsViewModelProtocol {
    var screenState: ScreenState { get }
    var advertisementID: String { get }
    var cellModel: AdvertisementDetailsCellModel? { get }
    
    func observeScreenState(_ handler: @escaping (ScreenState) -> Void)
}

final class AdvertisementDetailsViewModel: AdvertisementDetailsViewModelProtocol {    
    private let service: AdvertisementDetailsService
    
    @Observable
    private (set) var screenState: ScreenState = .loading
    
    private (set) var advertisementID: String
    private (set) var cellModel: AdvertisementDetailsCellModel?

    init(service: AdvertisementDetailsService = AdvertisementDetailsService(), advertisementID: String) {
        self.service = service
        self.advertisementID = advertisementID
        self.loadData()
    }
    
    func observeScreenState(_ handler: @escaping (ScreenState) -> Void) {
        $screenState.observe(handler)
    }
    
    func loadData() {
        service.getAdvertisementDetails(id: advertisementID) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let advertisement):
                self.cellModel = AdvertisementDetailsCellModel(advertisement: advertisement)
                self.screenState = .content
            case .failure(let error):
                self.screenState = .error(error.localizedDescription)
            }
        }
    }
}
