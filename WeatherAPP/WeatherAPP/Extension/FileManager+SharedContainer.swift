//
//  FileManager+SharedContainer.swift
//  WeatherAPP
//
//  Created by Doogie on 5/9/24.
//

import Foundation

extension FileManager {
  static var sharedContainer: URL? {
    return FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.WeatherAPP-Doogie.WeatherAPP.contents")
  }
}
