//
//  ViewController.swift
//  Weather
//
//  Created by Павел Курзо on 10.08.22.
//

import UIKit

class RootViewController: UIViewController {
    
    var cities: [CityNames] = [
        CityNames(cityName: "Warsaw"),
        CityNames(cityName: "London"),
        CityNames(cityName: "Minsk"),
        CityNames(cityName: "Bangkok"),
        CityNames(cityName: "Lagos"),
        CityNames(cityName: "Madrid"),
        CityNames(cityName: "Moscow"),
        CityNames(cityName: "Berlin")
    ]
    
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
        
        if let inputCityName = rootView.searchTextField.text, inputCityName.isEmpty == false && !cities.description.contains(inputCityName){
            cities.append(CityNames(cityName: inputCityName))
        } else {
            print("You already got this city")
        }
        rootView.searchTextField.text = nil
        
        for city in cities {
            WeatherAPI().requestWeather(city: CityNames(cityName: "\(city)")) { json, response in
            }
        }
        rootView.tableView.reloadData()
    }
}

extension RootViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("touched")
        print(cities)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            print("inserting")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherCell.identifier, for: indexPath)
        
        if let cell = cell as? WeatherCell {
            cell.backgroundColor = .systemBackground
            cell.layer.cornerRadius = 5
            WeatherAPI().requestWeather(city: cities[indexPath.row]) { json, response in
                cell.cityNameLabel.text = response.name
                cell.descriptionCityLabel.text = response.weather.first?.description
                let formatted = String(format: "%.0f", response.main.temp)
                cell.tempCityLabel.text = "\(formatted)°C"
            }
        }
        return cell
    }
}

extension RootViewController: UITableViewDelegate {
}

