//
//  File.swift
//  
//
//  Created by Nicolá Domingues on 07/02/2023.
//

import SwiftUI

public struct MSView<Content> : View where Content: View {
  @ViewBuilder let content: () -> Content
  public init(
    content: @escaping () -> Content
  ) {
    self.content = content
  }
  public var body: some View {
    ZStack {
      Color.theme.backgroundColor.edgesIgnoringSafeArea(.all)
      content()
    }
  }
}

struct MSView_Previews: PreviewProvider {
  static var previews: some View {
    MSView {
      Text("Hello world")
    }
  }
}
