//
//  WeatherAPI.swift
//  Weather
//
//  Created by Павел Курзо on 10.08.22.
//

import Foundation

struct CityNames {
    let cityName: String
}

class WeatherAPI {
    
    private let baseUrl = "api.openweathermap.org/data/2.5/"
    private let appid = "0058adaff3893eb760cbbf2c877c6e7d"
    
    private func makeUrl(_ method: String, parameter: [URLQueryItem]) -> URL? {
        
        var component = URLComponents()
        component.scheme = "https"
        component.path = baseUrl + method
        
        var queryItems = [
            URLQueryItem(name: "appid", value: appid)
        ]
        queryItems.append(contentsOf: parameter)
        
        component.queryItems = queryItems
        return component.url
    }
    
    func requestWeather(city: CityNames, completionHandler: ((String, WeatherResponse) -> Void)?) {
        let parameters = [
            URLQueryItem(name: "q", value: city.cityName),
            URLQueryItem(name: "lang", value: "eng"),
            URLQueryItem(name: "units", value: "metric")
        ]
        guard let weatherURL = makeUrl("weather", parameter: parameters) else { return }
        
        var request = URLRequest(url: weatherURL)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { data, response, error in
            
            if let data = data, let dataString = String(data: data, encoding: .utf8),
               let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data) {
                
                DispatchQueue.main.async {
                    completionHandler?(dataString, weatherResponse)
                }
            }
        }
        task.resume()
    }
}






//func getData(completion: @escaping (Result<[WeatherResponse], Error>) -> Void) {
//    let stringUrl = "https://api.openweathermap.org/data/2.5/weather?q=Warsaw&appid=0058adaff3893eb760cbbf2c877c6e7d&units=metric"
//    guard let url = URL(string: stringUrl) else { return }
//    let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
//        guard let data = data, error == nil else {
//            completion(.failure(APIError.noAnyData))
//            return
//        }
//        do {
//            let result = try JSONDecoder().decode(WeatherResponse.self, from: data)
//            completion(.success([result]))
//            print(result)
//        } catch {
//            completion(.failure(error))
//        }
//    })
//    task.resume()
//}
