//
//  WeatherEntry.swift
//  WeatherAPPWidgetExtension
//
//  Created by Doogie on 5/8/24.
//

import Foundation
import WidgetKit

struct WeatherEntry: TimelineEntry {
    let data: WidgetData
    var date: Date {
        data.date
    }
}
