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
        let entry = WeatherEntry(data: WidgetData.preview)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<WeatherEntry>) -> ()) {
        var entries = [WeatherEntry(data: .preview)]

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
