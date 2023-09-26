import Foundation

final class AdvertisementsListViewModel  {
    @Observable
    private (set) var advertisements:[AdvertisementModel] = []
    
    func observeProducts(_ handler: @escaping ([AdvertisementModel]) -> Void) {
        $advertisements.observe(handler)
    }
    
    func viewDidLoad() {
        guard let request = URLRequest.makeHTTPRequest(uRLString: "https://www.avito.st/s/interns-ios/main-page.json") else { return }
        let task = NetworkClient.shared.getObject(dataType: AdvertisementsModel.self, for: request) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let advertisements):
                self.advertisements = advertisements.advertisements
            case .failure(let error):
                print(error)
            }
        }
        task.resume()
    }
}
