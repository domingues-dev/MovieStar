import MSDomain
import MSStyle
import SwiftUI

struct MainView: View {
  let buttonSize = CGSize(width: 70, height: 70)
  var body: some View {
    ZStack {
      Color.theme.backgroundColor.edgesIgnoringSafeArea(.all)
      VStack {
        Spacer()
        ZStack {
          Button {
            //
          } label: {
            Image(systemName: "house.circle.fill")
              .resizable()
              .scaledToFit()
              .frame(width: buttonSize.width, height: buttonSize.height)
              .offset(y: -(76 - buttonSize.height * 3 / 4) )
              .tint(Color.theme.accentColor)
          }
          
          TabBarShape(buttonSize: buttonSize).fill(Color.theme.backgroundColor)
            .frame(height: 72)
            .padding(.horizontal, 12)
        }
      }
      .padding(.bottom, 18)
      .edgesIgnoringSafeArea(.bottom)
      .shadow(radius: 8)
      
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}

extension TabItem {
  var color: Color {
    switch self {
    case .home:
      return .theme.accentColor
    case .favorites:
      return .orange
    case .profile:
      return .indigo
    }
  }
}
