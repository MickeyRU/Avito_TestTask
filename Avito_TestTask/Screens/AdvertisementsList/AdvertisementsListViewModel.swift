import Foundation

protocol AdvertisementsListViewModelProtocol {
    var advertisements: [AdvertisementModel] { get }
    
    func observeProducts(_ handler: @escaping ([AdvertisementModel]) -> Void)
    func viewDidLoad()
}
final class AdvertisementsListViewModel: AdvertisementsListViewModelProtocol {
    private let service: AdvertisementsService
    
    @Observable
    private (set) var advertisements: [AdvertisementModel] = []
    
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
            case .failure(let error):
                // показать ошибку
                print(error)
            }
        }
    }
}
