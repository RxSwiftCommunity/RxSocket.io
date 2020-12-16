//
//  RxSocketTerminalInterdace.swift
//  RxSocket.io
//
//  Created by Behrad Kazemi on 5/21/20.
//  Copyright © 2020 RxSocket.io. All rights reserved.
//

import Foundation
import RxSwift

public protocol RxSocketTerminalInterdace {
	
	
	/// Generic function that observe to listen to a specific  *Decodable*  model
	///
	/// - Requires:
	/// 		a type to define *T* .
	///
	///	- Note:
	///		Example: let instrumentUpdate: Observable<CodableModel> = socketHandler.observe()
	///
  func observe<T: Codable>(eventName: String) -> Observable<T>
  
	/// Send an object as message through the socket connection
	///
	///	 - Requires:
	/// 		an *Encodable* type to define *T* .
	///
	///  - Parameters:
	///  		- model: an  *Encodable* model that will encode to json string and send  through the socket connection.
  ///     - eventName: the topic of messaging thread.
	///
  func send(eventName: String, model: Encodable)
}


