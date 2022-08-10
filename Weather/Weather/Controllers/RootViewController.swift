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
    
    var animals: [String] = ["Horse", "Cow", "Camel", "Pig", "Sheep", "Goat"]
    
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
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("touched")
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            animals.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            print("inserting")
        }
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

