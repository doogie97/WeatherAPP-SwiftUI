//
//  WeatherAPPWidget.swift
//  WeatherAPPWidget
//
//  Created by Doogie on 5/8/24.
//

import WidgetKit
import SwiftUI

struct SimpleEntry: TimelineEntry {
    let date: Date
    let emoji: String
}

struct WeatherAPPWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("Hi:")
            Text(entry.date, style: .time)

            Text("Emoji:")
            Text(entry.emoji)
        }
    }
}

struct WeatherAPPWidget: Widget {
    let kind: String = "WeatherAPPWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WeatherAPPWidgetEntryView(entry: entry)
                .padding()
                .background()
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct WeatherAPPWidget_Previews: PreviewProvider {
    static var previews: some View {
        WeatherAPPWidgetEntryView(entry: Provider.Entry(data: .preview))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
