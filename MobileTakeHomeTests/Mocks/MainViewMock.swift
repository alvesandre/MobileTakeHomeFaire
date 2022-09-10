//
//  MainViewMock.swift
//  MobileTakeHomeTests
//
//  Created by André Alves on 09/09/22.
//

import Foundation
@testable import MobileTakeHome

public class MainViewMock: MainViewProtocol {
    var numberOfCallsUpdateView: Int = 0
    var numberOfCallsShowError: Int = 0
    var message: String = ""
    
    public func updateView(with city: String, and currTemp: Double, and weatherDesc: String, and weatherImage: String, and minTemp: Double, and maxTemp: Double) {
        numberOfCallsUpdateView += 1
    }
    
    public func showError(with message: String) {
        numberOfCallsShowError += 1
        self.message = message
    }
}
