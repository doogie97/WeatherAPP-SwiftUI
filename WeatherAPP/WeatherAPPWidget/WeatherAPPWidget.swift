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
      if #available(iOS 17.0, *) {
          WeatherEntryView(entry: entry)
              .containerBackground(for: .widget) {
                  Color.clear
              }
              .padding()
              .background()
      } else {
          WeatherEntryView(entry: entry)
          .padding()
          .background()
      }
    }
    .configurationDisplayName("날씨 위젯")
    .description("현재 날씨를 확인할 위젯을 선택해 주세요.")
    .supportedFamilies([.systemSmall])
  }
}

@available(iOS 17.0, *)
#Preview("WeatherAPPWidget", as: .systemSmall) {
  WeatherAPPWidget()
} timeline: {
  WeatherEntry(data: .preview)
}
struct WeatherAPPWidget_Previews: PreviewProvider {
  static var previews: some View {
    WeatherEntryView(entry: Provider.Entry(data: .preview))
      .previewContext(WidgetPreviewContext(family: .systemSmall))
  }
}
