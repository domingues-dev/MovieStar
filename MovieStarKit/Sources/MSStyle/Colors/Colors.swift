import SwiftUI

public extension Color {
    static let theme: Theme = .main
}

public struct Theme {
    public let backgroundColor: Color
    public let accentColor: Color
}

public extension Theme {
  static let main = Theme(backgroundColor: Color("background", bundle: .module),
                          accentColor: Color("accent", bundle: .module))
}
