//
//  AppLogger.swift
//  SDO
//
//  Created by Joel Kingsley on 03/07/2022.
//

import Foundation

struct AppLogger {
    private init() {}
    
    static func debug(_ items: Any...) {
        log(level: "DEBUG", message: items)
    }
    
    static func error(_ items: String...) {
        log(level: "ERROR", message: items)
    }
    
    static func info(_ items: String...) {
        log(level: "INFO", message: items)
    }
    
    private static func log(level: String, message: Any...) {
        print("\(level): ", message)
    }
    
    static func initLog(_ file: String = #fileID) {
        info(".... Initializing \(file)")
    }
    
    static func deinitLog(_ file: String = #fileID) {
        info(".... Deinitializing \(file)")
    }
}
