//
//  WeatherCell.swift
//  Weather
//
//  Created by Павел Курзо on 10.08.22.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
    
    static let identifier = "WeatherCell"
    
    let cityNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionCityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tempCityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: WeatherCell.identifier)
        addSubview(cityNameLabel)
        addSubview(descriptionCityLabel)
        addSubview(tempCityLabel)
        setConstraints()
    }
    
    func set(weather: WeatherResponse) {
        cityNameLabel.text = weather.name
        descriptionCityLabel.text = weather.weather[0].description
        tempCityLabel.text = String(format: "%.0f °C", weather.main.temp)
    }

    func setConstraints() {
        let constraints = [
            cityNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            cityNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            
            descriptionCityLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 20),
            descriptionCityLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            
            tempCityLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            tempCityLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init(coder:) has not been implemented")
    }
}
