//
//  Double+Extension.swift
//  WeatherAPP
//
//  Created by Doogie on 5/7/24.
//

import Foundation

fileprivate let formatter: MeasurementFormatter = {
    let formatter = MeasurementFormatter()
    formatter.numberFormatter.maximumFractionDigits = 0
    formatter.unitOptions = .temperatureWithoutUnit
    return formatter
}()

extension Double {
    var temperatureString: String {
        let temperature = Measurement<UnitTemperature>(value: self, unit: .celsius)
        return formatter.string(from: temperature)
    }
}
