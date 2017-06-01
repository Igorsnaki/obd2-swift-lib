//
//  OBD2Facade.swift
//  OBD2Swift
//
//  Created by Max Vitruk on 24/05/2017.
//  Copyright © 2017 Lemberg. All rights reserved.
//

import Foundation


protocol ScanDelegate {
  func didReceive()
}

open class OBD2 {
  private var host : String
  private var port : Int
  
  var scanner : Scanner
  var connector : Connector
  var observer : SensorObserver

  public convenience init(){
    self.init(host : "192.168.0.10", port : 35000)
  }
  
  public init(host : String, port : Int){
    self.host = host
    self.port = port
    
    self.connector = Connector()
    self.observer = SensorObserver()
    self.scanner = Scanner(host: host, port: port)
    
    connector.scanner = scanner
    scanner.connector = connector
    scanner.observer = observer
  }
  
  var logger : Any?
  var cache : Any?
  
  public func connect(_ block : Connector.CallBack) {
    
    
    Logger.redirectLogToDocuments()
    
    Logger.info("Connection..")
    
    
    DispatchQueue.global().async {
        Logger.warning("global 1")
    }
    
    DispatchQueue.main.async {
        Logger.error("main 1")
    }
    
    DispatchQueue.global().async {
        Logger.warning("global 2")
    }
    
    DispatchQueue.main.async {
        Logger.error("main 2")
    }

    Logger.info("22")
    Logger.info("33")

    
    NSLog("--00001--")
    
    scanner.startScan()
  }
    
    
   
  
  public func disconnect(){
    //
  }
  
  public func startScan(){
    
  }
  
  public func stopScan(){
    
  }
  
  public func setSensors(){
    
  }
  
  public func requestTroubleCodes(){
    scanner.request(command: Command.init(from: "03"))
  }
  
  public func requestVIN(){
    scanner.request(command: Command.init(from: "0902"))
    testingDispatch()
  }
  
  public func request(command str: String){
    scanner.request(command: Command.init(from: str))
    testingDispatch()
  }
    
    
    func testingDispatch() {
        
        DispatchQueue.global().async {
            Logger.warning("global 1")
        }
        
        DispatchQueue.main.async {
            Logger.error("main 1")
        }
        
        DispatchQueue.global().async {
            Logger.warning("global 2")
        }
        
        DispatchQueue.main.async {
            Logger.error("main 2")
        }
        
        Logger.info("testig - 22")
        Logger.info("testig - 33")
        
    }
}
