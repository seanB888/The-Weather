//
//  Forecast.swift
//  The Weather
//
//  Created by SEAN BLAKE on 4/3/22.
//

import SwiftUI

// sample model and 10 days data...

struct DayForecast: Identifiable {
    var id = UUID().uuidString
    var day: String
    var farenheit: CGFloat
    var image: String
}

var forecast = [
    DayForecast(day: "Today", farenheit: 94, image: "sun.min"),
    DayForecast(day: "Wed", farenheit: 90, image: "cloud.sun"),
    DayForecast(day: "Thu", farenheit: 98, image: "cloud.sun.bolt"),
    DayForecast(day: "Fri", farenheit: 99, image: "sun.max"),
    DayForecast(day: "Sat", farenheit: 92, image: "cloud.sun"),
    DayForecast(day: "Sun", farenheit: 89, image: "cloud.sun"),
    DayForecast(day: "Mon", farenheit: 96, image: "sun.max"),
    DayForecast(day: "Tue", farenheit: 94, image: "sun.max"),
    DayForecast(day: "Wed", farenheit: 93, image: "cloud.sun.bolt"),
    DayForecast(day: "Thu", farenheit: 94, image: "sun.min")
]
