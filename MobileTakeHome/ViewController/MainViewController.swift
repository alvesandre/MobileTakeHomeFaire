//
//  MainViewController.swift
//  MobileTakeHome
//
//  Created by André Alves on 09/09/22.
//

import UIKit
import Kingfisher

public protocol MainViewProtocol: AnyObject {
    func updateView(with city: String, and currTemp: Double, and weatherDesc: String, and weatherImage: String, and minTemp: Double, and maxTemp: Double)
    func showError(with message: String)
}

class MainViewController: UIViewController {
    // MARK: - UI
    
    // MAIN STACK
    private lazy var mainStack: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.addArrangedSubview(cityLabel)
        stackView.addArrangedSubview(weatherStack)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // CITY NAME LABEL
    
    private lazy var cityLabel: UILabel = {
        var label = UILabel()
        label.text = "-"
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // WEATHER STACK
    
    private lazy var weatherStack: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.addArrangedSubview(resumeStack)
        stackView.addArrangedSubview(weatherDescLabel)
        stackView.addArrangedSubview(minMaxStack)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var resumeStack: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.addArrangedSubview(weatherImage)
        stackView.addArrangedSubview(tempLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var weatherImage: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 20)
        ])
        return imageView
    }()
    
    private lazy var tempLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.text = "-"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // WEATHER DESCRIPTION LABEL
    
    private lazy var weatherDescLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 10)
        label.text = "-"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MINMAX STACK
    
    private lazy var minMaxStack: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.addArrangedSubview(minTempLabel)
        stackView.addArrangedSubview(maxTempLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var minTempLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 10)
        label.text = "L: -"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var maxTempLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 10)
        label.text = "H: -"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Properties
    public var presenter: MainPresenterProtocol?
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.configureLayout()
        self.presenter?.fetchTemperature()
    }
    
    
    // MARK: - Private Methods
    
    private func configureLayout() {
        
        self.view.backgroundColor = .white
        self.view.addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    
}

// MARK: - MainViewProtocol

extension MainViewController: MainViewProtocol {
    func showError(with message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel);
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
    func updateView(with city: String, and currTemp: Double, and weatherDesc: String, and weatherImage: String, and minTemp: Double, and maxTemp: Double) {
        self.cityLabel.text = city
        if let url = URL(string: weatherImage) {
            self.weatherImage.kf.setImage(with: url)
        }
        self.tempLabel.text = "\(Int(currTemp))º"
        self.weatherDescLabel.text = weatherDesc
        self.minTempLabel.text = "L: \(Int(minTemp))º"
        self.maxTempLabel.text = "H: \(Int(maxTemp))º"
    }
}

