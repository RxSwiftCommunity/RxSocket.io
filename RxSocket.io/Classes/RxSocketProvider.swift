//
//  RxSocketProvider.swift
//  RxSocket.io
//
//  Created by Behrad Kazemi on 7/22/20.
//  Copyright © 2020 RxSocket.io. All rights reserved.
//

import Foundation

public final class RxSocketProvider: RxSocketProviderInterface {
  
  public init(){}
  
  public func makeSocketHandler(auth: [String: Any], url: URL) -> RxSocketTerminalInterdace & RxSocketToggle {
    return RxSocketHandler(withSourceURL: url, authInfo: auth)
  }
}
