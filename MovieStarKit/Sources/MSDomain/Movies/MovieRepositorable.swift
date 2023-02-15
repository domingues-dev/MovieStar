import Combine

public protocol MovieRepositorable {
  func getMovies() -> AnyPublisher<MovieListResponse, Error>
}
