import Foundation

public struct MovieListResponse: Codable {
  public let page: Int?
  public let results: [Movie]?
}

public struct Movie: Codable, Identifiable {
  public let id: Int?
  public let originalTitle: String?
  public let posterPath: String?
  public let isAdult: Bool?
  public let overview: String?
  public let releaseDate: String?
  public let genreIds: [Int]?
  public let originalLanguage: String?
  public let backdropPath: String?
  public let popularity: Double?
  public let voteCount: Int?
  public let hasVideo: Bool?
  public let averageVote: Double?
  
  public init(
    id: Int,
    originalTitle: String?,
    posterPath: String?,
    isAdult: Bool,
    overview: String?,
    releaseDate: String?,
    genreIds: [Int],
    originalLanguage: String?,
    backdropPath: String?,
    popularity: Double?,
    voteCount: Int?,
    hasVideo: Bool,
    averageVote: Double?
  ) {
    self.id = id
    self.originalTitle = originalTitle
    self.posterPath = posterPath
    self.isAdult = isAdult
    self.overview = overview
    self.releaseDate = releaseDate
    self.genreIds = genreIds
    self.originalLanguage = originalLanguage
    self.backdropPath = backdropPath
    self.popularity = popularity
    self.voteCount = voteCount
    self.hasVideo = hasVideo
    self.averageVote = averageVote
  }
  
  enum CodingKeys: String, CodingKey {
    case id
    case originalTitle = "original_title"
    case posterPath = "poster_path"
    case isAdult = "adult"
    case overview
    case releaseDate = "release_date"
    case genreIds = "genre_ids"
    case originalLanguage = "original_language"
    case backdropPath = "backdrop_path"
    case popularity
    case voteCount = "vote_count"
    case hasVideo = "video"
    case averageVote = "vote_average"
  }
}
