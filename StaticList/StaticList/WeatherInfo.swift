//
//  WeatherInfo.swift
//  StaticList
//
//  Created by SeongKook on 4/24/24.
//

import Foundation

struct WeatherInfo: Identifiable {
    var id = UUID()
    var image: String
    var temp: Int
    var city: String
}


extension WeatherInfo {
    // static 을 사용하게되면 WeatherInfo.weatherData 처럼 정적으로 프로퍼티를 사용할 수 있음
    static let weatherData: [WeatherInfo] = [
        WeatherInfo(image: "snow", temp: 5, city:"New York"),
        WeatherInfo(image: "cloud", temp:5, city:"Kansas City"),
        WeatherInfo(image: "sun.max", temp: 80, city:"San Francisco"),
        WeatherInfo(image: "snow", temp: 5, city:"Chicago"),
        WeatherInfo(image: "cloud.rain", temp: 49, city:"Washington DC"),
        WeatherInfo(image: "cloud.heavyrain", temp: 60, city:"Seattle"),
        WeatherInfo(image: "sun.min", temp: 75, city:"Baltimore"),
        WeatherInfo(image: "sun.dust", temp: 65, city:"Austin"),
        WeatherInfo(image: "sunset", temp: 78, city:"Houston"),
        WeatherInfo(image: "moon", temp: 80, city:"Boston"),
        WeatherInfo(image: "moon.circle", temp: 45, city:"Denver"),
        WeatherInfo(image: "cloud.snow", temp: 8, city:"Philadelphia"),
        WeatherInfo(image: "cloud.hail", temp: 5, city:"Memphis"),
        WeatherInfo(image: "cloud.sleet", temp:5, city:"Nashville"),
        WeatherInfo(image: "sun.max", temp: 80, city:"San Francisco"),
        WeatherInfo(image: "cloud.sun", temp: 5, city:"Atlanta"),
        WeatherInfo(image: "wind", temp: 88, city:"Las Vegas"),
        WeatherInfo(image: "cloud.rain", temp: 60, city:"Phoenix"),
    ]
}
