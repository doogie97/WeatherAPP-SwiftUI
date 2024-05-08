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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct WeatherEntryView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherEntryView(entry: Provider.Entry(data: .preview))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
