import SwiftUI

public enum TabItem: Hashable {
  case home, favorites, profile
  
  public var isMainTab: Bool { self == .home }
  
  public var iconName: String {
    switch self {
    case .home:
      return "house"
    case .favorites:
      return "star"
    case .profile:
      return "person"
    }
  }
  
  public var title: String {
    switch self {
    case .home:
      return "Home"
    case .favorites:
      return "Favorites"
    case .profile:
      return "Profile"
    }
  }
}

