import Foundation

protocol AdvertisementsListViewModelProtocol {
    var advertisements: [AdvertisementModel] { get }
    var cellModels: [AdvertisementCellModel] { get }
    
    func observeProducts(_ handler: @escaping ([AdvertisementModel]) -> Void)
    func viewDidLoad()
}
final class AdvertisementsListViewModel: AdvertisementsListViewModelProtocol {
    private let service: AdvertisementsService
    
    @Observable
    private (set) var advertisements: [AdvertisementModel] = []
    
    private (set) var cellModels: [AdvertisementCellModel] = []

    init(service: AdvertisementsService = AdvertisementsService()) {
        self.service = service
    }
    
    func observeProducts(_ handler: @escaping ([AdvertisementModel]) -> Void) {
        $advertisements.observe(handler)
    }
    
    func viewDidLoad() {
        service.getAdvertisements { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let advertisements):
                self.advertisements = advertisements.advertisements
                self.cellModels = advertisements.advertisements.map { AdvertisementCellModel(advertisement: $0) }
            case .failure(let error):
                // показать ошибку
                print(error)
            }
        }
    }
}
