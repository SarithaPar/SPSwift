//
//  BaseUITest.swift
//  SPSwiftProject
//
//  Created by Parsoya, Saritha(AWF) on 2/25/19.
//  Copyright © 2019 Parsoya, Saritha. All rights reserved.
//

import XCTest
import SBTUITestTunnel

class BaseUITest: XCTestCase {
    var dialogMonitorReference: NSObjectProtocol?
    
    override func setUp() {
        // do nothing
    }
    
    func mySetUp() {
        super.setUp()
        continueAfterFailure = false
        UITest.current = self
    }
    
    func waitUntilReadyToGo() {
        waitForBasicUIToBeReady()
        //        dismissStartupAlerts()
    }
    
    private func waitForBasicUIToBeReady() {
        XCTAssertTrue(UITest.app.tabBars.firstMatch.waitForExistence(timeout: 15), "App failed to open after 15 seconds")
    }
    
    private func dismissStartupAlerts() {
        dialogMonitorReference = addUIInterruptionMonitor(withDescription: "Startup Alert Dialogs ") { (alert) -> Bool in
            alert.buttons.element(boundBy: 1).tap()
            return true
        }
        app.swipeDown() // requiered to trigger the above dialog check
        
        if dialogMonitorReference != nil {
            let monitorTimeout: Int = 3
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(monitorTimeout)) { [weak self] in
                self?.clearDialogMonitor()
            }
        }
    }
    
    override func tearDown() {
        
        if self.testRun!.failureCount == 0 {
            if appIsActive() {
                
                clearDialogMonitor()
                UITest.app.monitorRequestRemoveAll()
                UITest.performCommandNamed(.logoutUserIfNeeded)
                //super.tearDown()
                resetToKnownState()
            }
        } else {
            UITest.performCommandNamed(.logoutUserIfNeeded)
            quitApp()
        }
    }
    
    func quitApp() {
        print(XCUIApplication().debugDescription)
        app.terminate()
        UITest.current = nil
        super.tearDown()
    }
    
    func resetToKnownState() {
        UITest.performCommandNamed(.resetMockedData)
        UITest.performCommandNamed(.clearCache)
        UITest.performCommandNamed(.resetUI)
        if UITest.app.tables["view_messagebox"].exists {
            TabBar().navigateTo(tab: .home)
        }
    }
    
    private func clearDialogMonitor() {
        if let reference = dialogMonitorReference {
            removeUIInterruptionMonitor(reference)
            dialogMonitorReference = nil
        }
    }
    
    func runStep(_ context: String, _ action: @escaping () -> Void) {
        XCTContext.runActivity(named: context) { _ in
            action()
        }
    }
    
    @discardableResult func waitForLoadingIndicatorNotExist(timeout: TimeInterval = 10) -> Bool {
        let predicate = NSPredicate(format: "exists == false")
        let indicator = UITest.app.activityIndicators[CommonIdentifiers.activityIndicator]
        let myExpectation = UITest.current.expectation(for: predicate, evaluatedWith: indicator, handler: nil)
        
        let result = XCTWaiter().wait(for: [myExpectation], timeout: timeout)
        return result == .completed
    }
}

