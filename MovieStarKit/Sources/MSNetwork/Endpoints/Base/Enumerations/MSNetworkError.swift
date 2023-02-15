//
//  File.swift
//  
//
//  Created by Nicolá Domingues on 09/02/2023.
//

import Foundation

enum MSNetworkError: Error {
      case noData
      case urlBuildFail
      case redirection
      case client
      case server
}
