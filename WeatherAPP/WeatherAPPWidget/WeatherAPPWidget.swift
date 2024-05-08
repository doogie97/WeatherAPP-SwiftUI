//
//  WeatherAPPWidget.swift
//  WeatherAPPWidget
//
//  Created by Doogie on 5/8/24.
//

import WidgetKit
import SwiftUI

struct WeatherAPPWidget: Widget {
    let kind: String = "WeatherAPPWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WeatherEntryView(entry: entry)
                .padding()
                .background()
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct WeatherAPPWidget_Previews: PreviewProvider {
    static var previews: some View {
        WeatherEntryView(entry: Provider.Entry(data: .preview))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
