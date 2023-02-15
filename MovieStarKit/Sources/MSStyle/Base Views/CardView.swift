
import SwiftUI

public struct CardView<Content>: View where Content: View {
  @ViewBuilder let content: () -> Content
  let cornerRadius: CGFloat
  let backgroundColor: Color
  public init(
    cornerRadius: CGFloat = 12,
    backgroundColor: Color = .theme.backgroundColor,
    content: @escaping () -> Content
  ) {
    self.cornerRadius = cornerRadius
    self.backgroundColor = backgroundColor
    self.content = content
  }
  public var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: cornerRadius)
        .fill(backgroundColor)
        .shadow(radius: 8)
      content()
    }
  }
}

struct SCardView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack{
      Color.theme.backgroundColor.edgesIgnoringSafeArea(.all)
      CardView {
        Text("Hello world Hello")
      }
      .frame(width: 200, height: 200)
      .padding(.horizontal, 20)
    }
  }
}
