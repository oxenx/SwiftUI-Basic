//
//  StaticListApp.swift
//  StaticList
//
//  Created by SeongKook on 4/24/24.
//

import SwiftUI

@main
struct StaticListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(weatherData:  WeatherInfo.weatherData)
        }
    }
}
