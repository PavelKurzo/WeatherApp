//
//  RootView.swift
//  Weather
//
//  Created by Павел Курзо on 10.08.22.
//

import Foundation
import UIKit

class RootView: UIView {

    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Weather"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tableView: UITableView = {
        let tv = UITableView(frame: .zero)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = UIColor(white: 1, alpha: 0.2)
        tv.register(WeatherCell.self, forCellReuseIdentifier: WeatherCell.identifier)
        return tv
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        backgroundColor = .systemBackground
        addSubview(mainLabel)
        addSubview(tableView)
        setConstraints()
    }

    func setConstraints() {
        let constraints = [
            mainLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 70),
            mainLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30),
            
            tableView.topAnchor.constraint(equalTo: mainLabel.topAnchor, constant: 100),
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)

        ]
        NSLayoutConstraint.activate(constraints)
    }
}
