import Foundation

final class AdvertisementDetailsService {
    private let urlStringForDetailsScreen =  "https://www.avito.st/s/interns-ios/details/"
    
    func getAdvertisementDetails(id: String, completion: @escaping (Result<AdvertisementDetailsModel, Error>) -> Void) {
        let urlString = "\(urlStringForDetailsScreen)\(id).json"
    
        guard let request = URLRequest.makeHTTPRequest(uRLString: urlString) else { return }
        let task = NetworkClient.shared.getObject(dataType: AdvertisementDetailsModel.self, for: request) { result in
            switch result {
            case .success(let advertisement):
                completion(.success(advertisement))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
