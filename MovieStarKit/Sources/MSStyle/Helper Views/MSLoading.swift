import SwiftUI

struct MSLoading: View {
  let style: LoadingStyle
  var size: CGSize {
    switch style {
    case .extraSmall:
      return CGSize(width: 25, height: 25)
    case .small:
      return CGSize(width: 50, height: 50)
    case .medium:
      return CGSize(width: 100, height: 100)
    case .large:
      return CGSize(width: 200, height: 200)
    }
  }
  let rotationTime: Double = 0.75
  let fullRotation: Angle = .degrees(360)
  let animationTime: Double = 1.9
  static let initialDegree: Angle = .degrees(270)
  @State var spinnerStart: CGFloat = 0.0
  @State var spinnerEndS1: CGFloat = 0.03
  @State var rotationDegreeS1: Angle = initialDegree
  
  @State var spinnerEndS2: CGFloat = 0.03
  @State var spinnerEndS3: CGFloat = 0.03
  @State var rotationDegreeS2: Angle = initialDegree
  @State var rotationDegreeS3: Angle = initialDegree
  let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
  var body: some View {
    ZStack {
      SpinnerCircle(style, start: spinnerStart,
                    end: spinnerEndS3,
                    rotation: rotationDegreeS3,
                    color: .theme.accentColor.opacity(0.25))
      
      SpinnerCircle(style, start: spinnerStart,
                    end: spinnerEndS2,
                    rotation: rotationDegreeS2,
                    color: .theme.accentColor.opacity(0.5))
      
      SpinnerCircle(style, start: spinnerStart,
                    end: spinnerEndS1,
                    rotation: rotationDegreeS1,
                    color: .theme.accentColor)
    }
    .frame(width: size.width, height: size.height)
    .onAppear {
      self.animateSpinner()
    }
  }
  
  private func animateSpinner() {
    withAnimation(Animation.easeInOut(duration: rotationTime * 2).repeatForever(autoreverses: false)) {
      self.rotationDegreeS1 += fullRotation
      self.rotationDegreeS2 += .degrees(180)
      self.rotationDegreeS3 += .degrees(90)
      self.spinnerEndS2 = 0.2
      self.spinnerEndS1 = 1
    }
  }
}


struct MSLoading_Previews: PreviewProvider {
  static var previews: some View {
    MSLoading(style: .medium)
  }
}
