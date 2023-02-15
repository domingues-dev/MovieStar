import SwiftUI

public enum LoadingStyle {
  case extraSmall
  case small
  case medium
  case large
}

public struct WithLoading<Content>: View where Content: View {
  var isLoading: Binding<Bool>
  let style: LoadingStyle
  @ViewBuilder let content: () -> Content
  
  public init(
    isLoading: Binding<Bool>,
    _ style: LoadingStyle = .medium,
    content: @escaping () -> Content
  ) {
    self.isLoading = isLoading
    self.style = style
    self.content = content
  }
  
  public var body: some View {
    ZStack {
      Color.theme.backgroundColor.edgesIgnoringSafeArea(.all)
      if isLoading.wrappedValue {
        MSLoading(style: self.style)
      } else {
        content()
      }
    }
  }
}

struct WithLoading_Previews: PreviewProvider {
  static var previews: some View {
    WithLoading(isLoading: .constant(true)) {
      Text("Hello world")
    }
  }
}
