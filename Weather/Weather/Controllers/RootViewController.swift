//
//  ViewController.swift
//  Weather
//
//  Created by Павел Курзо on 10.08.22.
//

import UIKit

class RootViewController: UIViewController {
    
    private var rootView: RootView {
        return self.view as! RootView
    }
    
    override func loadView() {
        super.loadView()
        self.view = RootView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
    }
}

extension RootViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherCell.identifier, for: indexPath) as! WeatherCell
        cell.backgroundColor = .systemBackground
        cell.layer.cornerRadius = 5
        return cell
    }

}

extension RootViewController: UITableViewDelegate {
    
}



