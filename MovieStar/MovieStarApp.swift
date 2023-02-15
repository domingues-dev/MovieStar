//
//  MovieStarApp.swift
//  MovieStar
//
//  Created by Nicolá Domingues on 03/02/2023.
//

import SwiftUI
import MSStyle

@main
struct MovieStarApp: App {
  
  init() {
    MSStyle.registerFonts()
  }
  
  var body: some Scene {
    WindowGroup {
      NavigationStack {
        ContentView(model: .init())
      }
    }
  }
}
