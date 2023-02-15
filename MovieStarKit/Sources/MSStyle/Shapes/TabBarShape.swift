import SwiftUI

public struct TabBarShape: Shape {
  let buttonSize: CGSize
  let cornerRadius: CGFloat
  public init(
    buttonSize: CGSize = .init(width: 64, height: 64),
    cornerRadius: CGFloat = 32
  ) {
    self.buttonSize = buttonSize
    self.cornerRadius = cornerRadius
  }
  public func path(in rect: CGRect) -> Path {
    Path { path in
      // start at bottom mid
      path.move(to: CGPoint(x: rect.midX, y: rect.height))
      // add line to bottom lefft corner
      path.addLine(to: CGPoint(x: cornerRadius, y: rect.height))
      // add bottom left corner
      path.addArc(center: CGPoint(x: cornerRadius, y: rect.height - cornerRadius),
                  radius: cornerRadius,
                  startAngle: .degrees(90),
                  endAngle: .degrees(180),
                  clockwise: false)
      // add line to top left corner
      path.addLine(to: CGPoint(x: rect.minX, y: cornerRadius))
      // add top left corner
      path.addArc(center: CGPoint(x: cornerRadius, y: cornerRadius),
                  radius: cornerRadius,
                  startAngle: .degrees(180),
                  endAngle: .degrees(270),
                  clockwise: false)
      // add line to top center - button width
      path.addLine(to: CGPoint(x: rect.midX - buttonSize.width, y: rect.minY))
      // add top center left curve
      path.addCurve(to: CGPoint(x: rect.midX, y: buttonSize.height * 3 / 4),
                    control1: CGPoint(x: rect.midX - buttonSize.width / 2, y: rect.minY),
                    control2: CGPoint(x: rect.midX - buttonSize.width * 2 / 3, y: buttonSize.height * 3 / 4))
      // add top center right curve
      path.addCurve(to: CGPoint(x: rect.midX + buttonSize.width, y: rect.minY),
                    control1: CGPoint(x: rect.midX + buttonSize.width * 2 / 3, y: buttonSize.height * 3 / 4),
                    control2: CGPoint(x: rect.midX + buttonSize.width / 2, y: rect.minY))
      // add line to top right corner
      path.addLine(to: CGPoint(x: rect.width - cornerRadius, y: rect.minY))
      // add top right corner
      path.addArc(center: CGPoint(x: rect.width - cornerRadius, y: cornerRadius),
                  radius: cornerRadius,
                  startAngle: .degrees(270),
                  endAngle: .degrees(0),
                  clockwise: false)
      // add line to bottom right corner
      path.addLine(to: CGPoint(x: rect.width, y: rect.height - cornerRadius))
      // add bottom right corner
      path.addArc(center: CGPoint(x: rect.width - cornerRadius, y: rect.height - cornerRadius),
                  radius: cornerRadius,
                  startAngle: .degrees(0),
                  endAngle: .degrees(90),
                  clockwise: false)
      // close path with line to bottom mid
      path.addLine(to: CGPoint(x: rect.midX, y: rect.height))
    }
  }
}
struct TabBarShape_Previews: PreviewProvider {
  
  static var previews: some View {
      VStack {
        Spacer()
        TabBarShape().fill()
          .frame(height: 72)
          .shadow(radius: 4)
      }
      .padding(.horizontal, 12)
      .padding(.bottom, 18)
      .edgesIgnoringSafeArea(.bottom)
  }
}
