//
//  MainPresenterMock.swift
//  MobileTakeHomeTests
//
//  Created by André Alves on 09/09/22.
//

import Foundation
@testable import MobileTakeHome

public class MainPresenterMock: MainPresenterProtocol {
    var numberOfCallsFetchTemperature: Int = 0
    
    public func fetchTemperature() {
        numberOfCallsFetchTemperature += 1
    }
}
