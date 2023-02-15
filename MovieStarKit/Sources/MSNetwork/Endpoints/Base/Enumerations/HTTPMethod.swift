import Foundation

enum HTTPMethod: String, RawRepresentable {
  case get = "GET"
  case post = "POST"
  case put = "PUT"
  case delete = "DELETE"
}
