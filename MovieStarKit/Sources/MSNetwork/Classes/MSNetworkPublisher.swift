import Foundation

protocol MSRequestBuildable {
  func buildRequest(for endpoint: Endpoint) throws -> URLRequest
}

final class MSNetworkBuilder: MSRequestBuildable {
  
  func buildRequest(for endpoint: Endpoint) throws -> URLRequest {
      var components = URLComponents()
      components.scheme = URLScheme.https.rawValue
      components.host = endpoint.host
      components.path = endpoint.path.appending(endpoint.endpoint)
      components.queryItems = endpoint.queryItems

      guard let url = components.url else {
          throw MSNetworkError.urlBuildFail
      }

      var request = URLRequest(url: url)
      request.httpMethod = endpoint.method.rawValue

      return request
  }
}
