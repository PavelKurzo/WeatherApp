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
    
    let searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "  type in your city"
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(white: 0.4, alpha: 0.6)
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("Search", for: .normal)
        button.setTitleColor(UIColor(white: 0.4, alpha: 0.6), for: .normal)
        button.backgroundColor = .lightGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(RootViewController().searchButtonPressed), for: .touchUpInside)
        return button
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
        addSubview(searchTextField)
        addSubview(searchButton)
        setConstraints()
    }

    func setConstraints() {
        let constraints = [
            mainLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 70),
            mainLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30),
            
            searchTextField.topAnchor.constraint(equalTo: mainLabel.topAnchor, constant: 70),
            searchTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30),
            searchTextField.widthAnchor.constraint(equalToConstant: 180),
            searchTextField.heightAnchor.constraint(equalToConstant: 40),
            
            searchButton.topAnchor.constraint(equalTo: mainLabel.topAnchor, constant: 70),
            searchButton.leftAnchor.constraint(equalTo: searchTextField.rightAnchor, constant: 20),
            searchButton.widthAnchor.constraint(equalToConstant: 90),
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            
            tableView.topAnchor.constraint(equalTo: searchTextField.topAnchor, constant: 80),
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
