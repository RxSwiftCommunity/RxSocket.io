//
//  RxSocketToggle.swift
//  RxSocket.io
//
//  Created by Behrad Kazemi on 7/15/20.
//  Copyright © 2020 RxSocket.io. All rights reserved.
//

import Foundation
import RxSwift

public protocol RxSocketToggle {
  /// Creates a websocket connection to the given URL and start streaming.
  ///
  /// -  returns:
  ///      - an observable of boolian value of  *isConnected*.
  ///
  func start() -> Observable<Bool>
  
  /// Stop web socket streaming.
  ///
  func stop()
}
