//
//  Weather.swift
//  Task Tracker
//
//  Created by Oleksii Tsoniev on 11/8/17.
//  Copyright © 2017 Oleksii Tsoniev. All rights reserved.
//

import Foundation
import SwiftyJSON

class Weather: Model {
    
    var time: String?
    var summary: String?
    var iconName: String?
    var precipIntencity: String?
    var precipProbability: String?
    var temperature: String?
    var apparentTemperature: String?
    var dewPoint: String?
    var humidity: String?
    var pressure: String?
    var windSpeed: String?
    var windGust: String?
    var windBearing: String?
    var cloudCover: String?
    var uvIndex: String?
    var ozone: String?
    
    override func map(dictionary: [String : Any?]) {
        let dict = JSON(dictionary)
        
        time = dict[kTimeKey].stringValue
        summary = dict[kSummaryKey].stringValue
        iconName = dict[kIconKey].stringValue
        precipIntencity = dict[kPrecipIntencityKey].stringValue
        precipProbability = dict[kPrecipProbabilityKey].stringValue
        temperature = dict[kTemperatureKey].stringValue
        apparentTemperature = dict[kApparentTemperatureKey].stringValue
        dewPoint = dict[kDewPointKey].stringValue
        humidity = dict[kHumidityKey].stringValue
        pressure = dict[kPressureKey].stringValue
        windSpeed = dict[kWindSpeedKey].stringValue
        windGust = dict[kWindGustKey].stringValue
        windBearing = dict[kWindBearingKey].stringValue
        cloudCover = dict[kCloudCoverKey].stringValue
        uvIndex = dict[kUvIndexKey].stringValue
        ozone = dict[kOzoneKey].stringValue

    }
    
}
