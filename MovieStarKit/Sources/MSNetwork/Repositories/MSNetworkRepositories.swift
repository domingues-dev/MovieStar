import MSDomain

final class MSNetworkRepositories {
  let movieNetworkRepo: MovieRepositorable
  
  init(
    movieNetworkRepo: MovieRepositorable = MovieRepository()
  ) {
    self.movieNetworkRepo = movieNetworkRepo
  }
}
