//
//  NetworkWeatherManager.swift
//  Sunooo
//
//  Created by Quasar on 08.05.2022.
//

import Foundation

struct NetworkWeatherManager {
    func fetchCurrentWeather(forCity city: String) {
    let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&apikey=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
            let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
                if let data = data {
                    self.parseJSON(withData: data)
                }
            }
            task.resume()
}

    func parseJSON(withData data: Data) {
        let decoder = JSONDecoder()
        
        do {
      let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            print(currentWeatherData.weather)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
