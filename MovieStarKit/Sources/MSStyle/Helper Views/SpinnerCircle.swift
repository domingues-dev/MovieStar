//
//  SwiftUIView.swift
//  
//
//  Created by Nicolá Domingues on 08/02/2023.
//

import SwiftUI

struct SpinnerCircle: View {
  let style: LoadingStyle
  let start: CGFloat
  let end: CGFloat
  let rotation: Angle
  var lineWidth: CGFloat {
    switch style {
    case .extraSmall:
      return 4
    case .small:
      return 8
    case .medium:
      return 12
    case .large:
      return 16
    }
  }
  let color: Color
  
  init(
    _ style: LoadingStyle,
    start: CGFloat,
    end: CGFloat,
    rotation: Angle,
    color: Color
  ) {
    self.style = style
    self.start = start
    self.end = end
    self.color = color
    self.rotation = rotation
  }
  
  var body: some View {
    Circle()
      .trim(from: start, to: end)
      .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
      .fill(color)
      .rotationEffect(rotation)
  }
}

struct SpinnerCircle_Previews: PreviewProvider {
    static var previews: some View {
      SpinnerCircle(.large, start: 0, end: 0.95, rotation: .degrees(270), color: .theme.accentColor)
        .padding(40)
    }
}
