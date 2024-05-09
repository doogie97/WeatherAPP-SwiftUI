//
//  Provider.swift
//  WeatherAPPWidgetExtension
//
//  Created by Doogie on 5/8/24.
//

import Foundation
import WidgetKit

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> WeatherEntry {
        WeatherEntry(data: WidgetData.preview)
    }

    func getSnapshot(in context: Context, completion: @escaping (WeatherEntry) -> ()) {
        var data = WidgetData.preview
        if !context.isPreview {
            let list = WidgetData.read()
            if let weatherData = list.first {
                data = weatherData
            }
        }
        let entry = WeatherEntry(data: data)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<WeatherEntry>) -> ()) {
        let entries = WidgetData.read().compactMap {
            return WeatherEntry(data: $0)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
