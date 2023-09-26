import Foundation

final class AdvertisementsService {
    private let urlStringForMainScreen =  "https://www.avito.st/s/interns-ios/main-page.json"
    
    func getAdvertisements(completion: @escaping (Result<AdvertisementsModel, Error>) -> Void) {
        guard let request = URLRequest.makeHTTPRequest(uRLString: urlStringForMainScreen) else { return }
        let task = NetworkClient.shared.getObject(dataType: AdvertisementsModel.self, for: request) { result in
            switch result {
            case .success(let advertisements):
                completion(.success(advertisements))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
