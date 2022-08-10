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
    var selectedButton: Bool = true
    
    var cityNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "test"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: WeatherCell.identifier)
        addSubview(cityNameLabel)
        setConstraints()
    }

    func setConstraints() {
        let constraints = [

            cityNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            cityNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 100),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init(coder:) has not been implemented")
    }
}
