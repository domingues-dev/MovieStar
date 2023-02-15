//
//  ContentView.swift
//  MovieStar
//
//  Created by Nicolá Domingues on 03/02/2023.
//

import Combine
import MSStyle
import SwiftUI
import MSDomain
import MSNetwork

class MovieViewModel: ObservableObject {
  @Published var movies = [Movie]()
  @Published var isLoading = true
  var cancellables = Set<AnyCancellable>()
  let repository: MovieRepositorable
  
  init(repository: MovieRepositorable = MovieRepository()) {
    self.repository = repository
  }
  
  func getPopularMovies() {
    repository.getMovies()
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { completion in
      switch completion {
      case .failure(let error):
        print(error)
      case .finished:
        print("finished")
      }
    }, receiveValue: { response in
      self.movies = response.results ?? []
      self.isLoading = false
    })
      .store(in: &cancellables)
  }
}

struct ContentView: View {
  @ObservedObject var model: MovieViewModel
  var body: some View {
    WithLoading(isLoading: $model.isLoading) {
      List(model.movies) {
        Text($0.originalTitle ?? "Undefined")
      }
    }
    .navigationTitle("MSView")
    .toolbarColorScheme(.dark, for: .navigationBar)
    .toolbarBackground(Color.theme.accentColor, for: .navigationBar)
    .onAppear {
      self.model.getPopularMovies()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      ContentView(model: .init())
      }
//        .toolbarBackground(.visible, for: .navigationBar)
  }
}
