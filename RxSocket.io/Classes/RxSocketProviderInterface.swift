//
//  RxSocketProviderInterface.swift
//  RxSocket.io
//
//  Created by Behrad Kazemi on 7/22/20.
//  Copyright © RxSwiftCommunity. All rights reserved.
//

import Foundation

public protocol RxSocketProviderInterface {
  func makeSocketHandler(auth: [String: Any], url: URL) -> RxSocketTerminalInterface & RxSocketToggle
}
