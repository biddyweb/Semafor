//
//  AppDelegateTests.swift
//  Semafor
//
//  Created by Marius Serban on 27/12/2014.
//  Copyright (c) 2014 Marius Serban. All rights reserved.
//

import UIKit
import XCTest

class AppDelegateTests: XCTestCase {

    class MockPersistence: Persistence {
        
        var saveCalled = false;
        
        func savePendingChanges() {
            saveCalled = true;
        }
    }
    
    let sut = AppDelegate()
    let mockPersistence = MockPersistence();
    
    override func setUp() {
        
        sut.persistence = mockPersistence
    }
    
    func testPersistenceSavedAtAppTermination() {
        
        sut.applicationWillTerminate(UIApplication.sharedApplication())
        
        XCTAssertTrue(mockPersistence.saveCalled, "Make sure changes are saved before the app exits.")
    }
}
