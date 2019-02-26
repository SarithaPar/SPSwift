//
//  UITest.swift
//  SPSwiftProjectUITests
//
//  Created by Parsoya, Saritha(AWF) on 2/25/19.
//  Copyright © 2019 Parsoya, Saritha. All rights reserved.
//

import Foundation
import SBTUITestTunnel

class UITest {
    static var current: XCTestCase!
    static var app: SBTUITunneledApplication! {
        return current.app
    }
    
    @discardableResult static func performCommandNamed<T : Codable>(_ command: AppCommands, object: T) -> Any? {
        do {
            return UITest.app.performCustomCommandNamed(command.rawValue, object: try TunnelEncoder.encode(object))
        }
        catch {
            XCTFail("could not encode object for use in app command")
            return nil
        }
    }
    
    @discardableResult static func performCommandNamed(_ command: AppCommands) -> Any? {
        return UITest.app.performCustomCommandNamed(command.rawValue, object: nil)
    }
    
    @discardableResult static func performCommandNamed<T : Codable>(_ command: AppCommands) -> T? {
        guard let result = UITest.app.performCustomCommandNamed(command.rawValue, object: nil) as? NSObject else {
            XCTFail("app command response is not a format that could be decoded")
            return nil
        }
        return TunnelEncoder.decode(result)
    }
}
