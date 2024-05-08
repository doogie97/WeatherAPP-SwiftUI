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
        .configurationDisplayName("날씨 위젯")
        .description("현재 날씨를 확인할 위젯을 선택해 주세요.")
        .supportedFamilies([.systemSmall])
    }
}

struct WeatherAPPWidget_Previews: PreviewProvider {
    static var previews: some View {
        WeatherEntryView(entry: Provider.Entry(data: .preview))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
