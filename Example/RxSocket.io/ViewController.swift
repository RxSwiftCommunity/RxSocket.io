//
//  ViewController.swift
//  RxSocket.io
//
//  Created by behrad-kzm on 12/16/2020.
//  Copyright (c) 2020 behrad-kzm. All rights reserved.
//

import UIKit
import RxSocket_io
import RxCocoa
import RxSwift

class ViewController: UIViewController {
  let disposeBag = DisposeBag()
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let socket = RxSocketProvider().makeSocketHandler(auth: ["token" : "test"], url: URL(string: "wss://echo.testsocket.com")!)
    socket.start().subscribe(onNext: { (connected) in
      print("connection status", connected)
    }, onError: { (error) in
      print(error)
    }).disposed(by: disposeBag)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    
  }
}

