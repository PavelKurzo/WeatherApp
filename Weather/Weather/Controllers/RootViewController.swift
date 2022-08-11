//
//  ViewController.swift
//  Weather
//
//  Created by Павел Курзо on 10.08.22.
//

import UIKit

class RootViewController: UIViewController {
    
    var weatherAPI = WeatherAPI()
    var results = [WeatherResponse]()
    
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
    
    @objc func searchButtonPressed() {
        
        if let inputCityName = rootView.searchTextField.text, inputCityName.isEmpty == false && !results.map({ $0.name }).contains(inputCityName){
            fetchWeather(for: inputCityName)
        } else {
            print("You already got this city")
        }
        rootView.searchTextField.text = nil
    }
    
    private func fetchWeather(for city: String) {
        weatherAPI.requestWeather(city: city) { [weak self] result in
            switch result {
            case .success(let data):
                self?.results.append(data)
                self?.rootView.tableView.reloadData()
            case .failure:
                break
            }
        }
    }
}


extension RootViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            results.remove(at: indexPath.row)
            rootView.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherCell.identifier, for: indexPath) as? WeatherCell else { return UITableViewCell() }
        cell.set(weather: results[indexPath.row])
        
        return cell
    }
}

extension RootViewController: UITableViewDelegate {
    
}

