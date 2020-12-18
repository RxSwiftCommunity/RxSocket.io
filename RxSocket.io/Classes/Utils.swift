//
//  Utils.swift
//  RxSocket.io
//
//  Created by Behrad Kazemi on 7/13/20.
//  Copyright © RxSwiftCommunity. All rights reserved.
//

import Foundation


extension Encodable {
  var dictionary: [String: Any]? {
    guard let data = try? JSONEncoder().encode(self) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
  }
}
  
extension Dictionary where Key == String, Value: Any {

    func object<T: Decodable>() -> T? {
        if let data = try? JSONSerialization.data(withJSONObject: self, options: []) {
            return try? JSONDecoder().decode(T.self, from: data)
        } else {
            return nil
        }
    }
}

extension String {
  func dictionary() -> [String: Any]? {
      if let data = self.data(using: .utf8) {
          do {
              return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
          } catch {
              print(error.localizedDescription)
          }
      }
      return nil
  }
}
