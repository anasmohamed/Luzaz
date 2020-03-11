//
//  VersionChecker.swift
//  Luzaz
//
//  Created by Anas Mohamed on 3/11/20.
//  Copyright © 2020 Luzaz. All rights reserved.
//

import Foundation
import Alamofire

class VersionChecker {

  public static let shared = VersionChecker()

  func isUpdateAvailable(callback: @escaping (Bool)->Void) {
    let bundleId = Bundle.main.infoDictionary!["CFBundleIdentifier"] as! String
    Alamofire.request("https://itunes.apple.com/lookup?bundleId=\(bundleId)").responseJSON { response in
      if let json = response.result.value as? NSDictionary, let results = json["results"] as? NSArray, let entry = results.firstObject as? NSDictionary, let versionStore = entry["version"] as? String, let versionLocal = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
        let arrayStore = versionStore.split(separator: ".")
        let arrayLocal = versionLocal.split(separator: ".")

        if arrayLocal.count != arrayStore.count {
          callback(true) // different versioning system
        }

        // check each segment of the version
        for (key, value) in arrayLocal.enumerated() {
          if Int(value)! < Int(arrayStore[key])! {
            callback(true)
          }
        }
      }
      callback(false) // no new version or failed to fetch app store version
    }
  }

}
