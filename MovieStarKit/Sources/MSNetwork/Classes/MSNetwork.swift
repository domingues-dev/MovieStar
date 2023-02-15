import Combine
import Foundation

protocol MSNetworkable {
  func publish<Model>(endpoint: Endpoint) -> AnyPublisher<Model, Error> where Model : Decodable
}

public class MSNetwork: MSNetworkable {
  
  let builder: MSNetworkRequestBuildable
  let urlSession: URLSession
  
  init(builder: MSNetworkRequestBuildable = MSNetworkRequestBuilder(), configuration: URLSessionConfiguration = .default) {
    self.builder = builder
    self.urlSession = URLSession(configuration: configuration)
  }
  
  func publish<Model>(endpoint: Endpoint) -> AnyPublisher<Model, Error> where Model : Decodable {
    do {
      let request = try builder.buildRequest(for: endpoint)
      return urlSession.dataTaskPublisher(for: request)
        .map {
          let result = try? JSONDecoder().decode(Model.self, from: $0.data)
          return $0.data
        }
        .decode(type: Model.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
    } catch {
      return Fail(error: error).eraseToAnyPublisher()
    }
  }
}
