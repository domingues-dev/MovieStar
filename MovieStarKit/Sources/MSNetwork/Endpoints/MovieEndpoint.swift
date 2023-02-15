import Foundation

enum MovieEndpoint {
  case popularList
}

extension MovieEndpoint: Endpoint {
  var host: String {
    "api.themoviedb.org"
  }
  
  var path: String {
    "/3/movie/"
  }
  
  var endpoint: String {
    switch self {
    case .popularList:
      return "popular"
    }
  }
  
  var method: HTTPMethod {
    switch self {
    case.popularList:
      return .get
    }
  }
  
  var queryItems: [URLQueryItem]? {
    nil
  }
  
  var headers: HTTPHeader {
    [.authorization: "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlZTRhNDM1MDllY2QyYTMyOTU3YzJmNGQ4ZTBiOTc1OCIsInN1YiI6IjYzZGM3Yzc2OTM2OWEyMDA3Y2RkOTNiNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.JHyQGlXCMH6AzG7lJqOJQltRMCDEJUZaSc7pCMU3NtA"]
  }
}
