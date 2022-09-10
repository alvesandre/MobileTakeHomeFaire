//
//  MainViewControllerTests.swift
//  MobileTakeHomeTests
//
//  Created by André Alves on 09/09/22.
//

import XCTest
@testable import MobileTakeHome

class MainViewControllerTests: XCTestCase {

    func testViewWillAppear() {
        let viewController = MainViewController()
        let presenterMock = MainPresenterMock()
        viewController.presenter = presenterMock
        viewController.viewWillAppear(true)
        
        XCTAssertEqual(presenterMock.numberOfCallsFetchTemperature, 1)
    }

}
