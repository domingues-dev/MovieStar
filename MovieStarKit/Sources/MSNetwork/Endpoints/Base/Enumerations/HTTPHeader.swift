import Foundation

typealias HTTPHeader = [HTTPHeaderKey: String]

enum HTTPHeaderKey: String, RawRepresentable {
  case authorization
}
