//
//  WeatherEntryView.swift
//  WeatherAPPWidgetExtension
//
//  Created by Doogie on 5/9/24.
//

import SwiftUI
import WidgetKit

struct WeatherEntryView: View {
    var entry: Provider.Entry
    
    var body: some View {
      if #available(iOS 17.0, *) {
        contentsView
        .containerBackground(for: .widget) {
          Color.clear
        }
      } else {
        contentsView
      }
    }
  
  private var contentsView: some View {
    ZStack {
      LinearGradient(colors: [.orange, .blue],
                     startPoint: .topLeading,
                     endPoint: .bottomTrailing)
      
      VStack(alignment: .leading) {
        Text(entry.data.location)
        Text(entry.data.temperature)
          .font(.largeTitle)
        
        Spacer()
        
        Image(systemName: entry.data.icon)
          .symbolRenderingMode(.multicolor)
        Text(entry.data.weather)
          .font(.caption)
        Text("최저 : \(entry.data.minTemperature) 최고 : \(entry.data.maxTemperature)")
          .font(.caption)
          .frame(maxWidth: .infinity, alignment: .leading)
      }
      .foregroundStyle(.white)
      .padding()
    }
  }
}

struct WeatherEntryView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherEntryView(entry: Provider.Entry(data: .preview))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
