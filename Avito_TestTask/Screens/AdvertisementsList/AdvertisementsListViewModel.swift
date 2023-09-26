import Foundation

protocol AdvertisementsListViewModelProtocol {
    var screenState: ScreenState { get }
    var advertisements: [AdvertisementModel] { get }
    var cellModels: [AdvertisementCellModel] { get }
    
    func observeScreenState(_ handler: @escaping (ScreenState) -> Void)
    func viewDidLoad()
}

final class AdvertisementsListViewModel: AdvertisementsListViewModelProtocol {
    private let service: AdvertisementsService
    
    @Observable
    private (set) var screenState: ScreenState = .loading
    
    private (set) var advertisements: [AdvertisementModel] = []
    private (set) var cellModels: [AdvertisementCellModel] = []

    init(service: AdvertisementsService = AdvertisementsService()) {
        self.service = service
    }
    
    func observeScreenState(_ handler: @escaping (ScreenState) -> Void) {
        $screenState.observe(handler)
    }
    
    func viewDidLoad() {        
        service.getAdvertisements { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let advertisements):
                self.advertisements = advertisements.advertisements
                self.cellModels = advertisements.advertisements.map { AdvertisementCellModel(advertisement: $0) }
                self.screenState = .content
            case .failure(let error):
                self.screenState = .error(error.localizedDescription)
            }
        }
    }
}
