import Combine
import Foundation
import MSDomain

public final class MovieRepository: MSNetwork, MovieRepositorable {
  
  public init() {
    super.init()
  }
  
  public func getMovies() -> AnyPublisher<MovieListResponse, Error> {
    return publish(endpoint: MovieEndpoint.popularList)
  }
}
