//
//  RxSocketHandler.swift
//  RxSocket.io
//
//  Created by Behrad Kazemi on 5/21/20.
//  Copyright © 2020 RxSocket.io. All rights reserved.
//

import Foundation
import RxSwift
import SocketIO

public class RxSocketHandler: RxSocketTerminalInterdace, RxSocketToggle {
  
  private let manager: SocketManager
  private let socket: SocketIOClient
  private var authInfo: [String: Any]
  private var needsReconnect = false
  public init(withSourceURL url: URL, timeout: TimeInterval = 15, authInfo: [String: Any]){
    
    self.manager = SocketManager(socketURL: url, config: [.log(true), .compress, .connectParams(authInfo)])
    self.socket = manager.defaultSocket
    self.authInfo = authInfo
  }
  
  public func start() -> Observable<Bool> {
    forceStart()
    let subject = PublishSubject<Bool>()
    socket.on(clientEvent: .connect) { (_, _) in
      subject.onNext(true)
    }
    socket.on(clientEvent: .disconnect) { (_, _) in
      subject.onNext(false)
    }
    return subject.asObservable()
  }
  
  private func forceStart() {
    socket.connect(timeoutAfter: 2) { [unowned self] in
      self.forceStart()
    }
  }
  
  public func stop() {
    socket.disconnect()
  }
  
  public func observe<T: Codable>(eventName: String) -> Observable<T> {

    
    let publishSubject = PublishSubject<T>.init()
    socket.on(eventName) { (data, ack) in
      
      if let dict = data.first as? [String: Any?], let object: T = dict.object() {
        publishSubject.onNext(object)
      }      
    }
    return publishSubject.asObservable()
  }
  
  public func send(eventName: String, model: Encodable) {
    guard let dict = model.dictionary else { return }
    if socket.status == .connected {
      socket.emit(eventName, dict)
      return
    }
    socket.connect()
    self.send(eventName: eventName, model: model)
  }
}

