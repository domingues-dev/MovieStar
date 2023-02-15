import Foundation

protocol Endpoint {
  var host: String { get }
  var path: String { get }
  var endpoint: String { get }
  var method: HTTPMethod { get }
  var queryItems: [URLQueryItem]? { get }
  var headers: HTTPHeader { get }
}
