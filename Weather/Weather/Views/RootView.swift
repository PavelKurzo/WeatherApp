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
        setConstraints()
    }

    func setConstraints() {
        let constraints = [
            mainLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 70),
            mainLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30),

        ]
        NSLayoutConstraint.activate(constraints)
    }
}
