//
//  MainPresenterTests.swift
//  MobileTakeHomeTests
//
//  Created by André Alves on 09/09/22.
//

import XCTest
@testable import MobileTakeHome

class MainPresenterTests: XCTestCase {
    func testFetchTemperatureSuccess() {
        let viewMock = MainViewMock()
        let presenter = MainPresenter(view: viewMock)
        API.shared = APIMockSuccess()
        presenter.fetchTemperature()
        XCTAssertEqual(viewMock.numberOfCallsUpdateView, 1)
    }
    
    func testFetchTemperatureNoWeatherError() {
        let viewMock = MainViewMock()
        let presenter = MainPresenter(view: viewMock)
        API.shared = APIMockNoWeather()
        presenter.fetchTemperature()
        XCTAssertEqual(viewMock.numberOfCallsShowError, 1)
        XCTAssertEqual(viewMock.message, "Weather not found for the next days.")
    }
    
    func testFetchTemperatureErrorRequest() {
        let viewMock = MainViewMock()
        let presenter = MainPresenter(view: viewMock)
        API.shared = APIMockErrorRequest()
        presenter.fetchTemperature()
        XCTAssertEqual(viewMock.numberOfCallsShowError, 1)
        XCTAssertEqual(viewMock.message, "custom error")
    }
    
    func testFetchTemperatureErrorWrongURL() {
        let viewMock = MainViewMock()
        let presenter = MainPresenter(view: viewMock)
        API.shared = APIMockErrorWrongURL()
        presenter.fetchTemperature()
        XCTAssertEqual(viewMock.numberOfCallsShowError, 1)
        XCTAssertEqual(viewMock.message, "URL seems wrong. Verify the URL string and try again later.")
    }
    
    func testFetchTemperatureErrorEmptyData() {
        let viewMock = MainViewMock()
        let presenter = MainPresenter(view: viewMock)
        API.shared = APIMockErrorEmptyData()
        presenter.fetchTemperature()
        XCTAssertEqual(viewMock.numberOfCallsShowError, 1)
        XCTAssertEqual(viewMock.message, "Received an empty data from request. Try again later.")
    }
    
    func testFetchTemperatureErrorParse() {
        let viewMock = MainViewMock()
        let presenter = MainPresenter(view: viewMock)
        API.shared = APIMockErrorParse()
        presenter.fetchTemperature()
        XCTAssertEqual(viewMock.numberOfCallsShowError, 1)
        XCTAssertEqual(viewMock.message, "Error on parse data.")
    }
}
