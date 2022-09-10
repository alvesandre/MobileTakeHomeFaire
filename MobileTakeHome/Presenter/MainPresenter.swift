//
//  MainPresenter.swift
//  MobileTakeHome
//
//  Created by André Alves on 09/09/22.
//

import Foundation
import SVProgressHUD

protocol MainPresenterProtocol: AnyObject {
    func fetchTemperature()
}

public class MainPresenter {
    var view: MainViewProtocol?
    
    init(view: MainViewProtocol) {
        self.view = view
    }
}

// MARK: - MainPresenterProtocol
extension MainPresenter: MainPresenterProtocol {
    func fetchTemperature() {
        SVProgressHUD.show()
        API.shared.fetchWeather(with: 4418) { result in
            SVProgressHUD.dismiss()
            switch result {
            case .success(let weather):
                guard let currentWeatherDay = weather?.weatherDays?.first else {
                    self.view?.showError(with: "Weather not found for the next days.")
                    return
                }
                self.view?.updateView(with: weather?.locationName ?? "", and: currentWeatherDay.currTemp ?? 0.0, and: currentWeatherDay.name ?? "", and: "https://cdn.faire.com/static/mobile-take-home/icons/\(currentWeatherDay.imgName ?? "").png", and: currentWeatherDay.minTemp ?? 0.0, and: currentWeatherDay.maxTemp ?? 0.0)
            case .failure(let error):
                self.view?.showError(with: error.localizedDescription)
            }
        }
    }
}

