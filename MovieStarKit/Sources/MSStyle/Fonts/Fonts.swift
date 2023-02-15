import SwiftUI
import Tagged

public typealias FontName = Tagged<Font, String>

extension FontName {
  public static let sulphur: Self = "SulphurPoint-Regular"
  public static let sulphurBold: Self = "SulphurPoint-Bold"
  public static let sulphurLight: Self = "SulphurPoint-Light"
}

extension Font {
  public static func custom(_ name: FontName, size: CGFloat) -> Self {
    .custom(name.rawValue, size: size)
  }
}

extension View {
  public func adaptiveFont(
    _ name: FontName,
    size: CGFloat,
    configure: @escaping (Font) -> Font = { $0 }
  ) -> some View {
    self.modifier(AdaptiveFont(name: name.rawValue, size: size, configure: configure))
  }
}

private struct AdaptiveFont: ViewModifier {
  @Environment(\.adaptiveSize) var adaptiveSize
  
  let name: String
  let size: CGFloat
  let configure: (Font) -> Font
  
  func body(content: Content) -> some View {
    content.font(self.configure(.custom(self.name, size: self.size + self.adaptiveSize.padding)))
  }
}

struct Fonts_Previews: PreviewProvider {
  static var previews: some View {
    registerFonts()

    return VStack(alignment: .leading, spacing: 12) {
      ForEach(
        [10, 12, 14, 16, 18, 20, 24, 32, 60].reversed(),
        id: \.self
      ) { fontSize in
        Text("Today’s daily challenge")
          .adaptiveFont(.sulphur, size: CGFloat(fontSize))
      }
    }
  }
}
