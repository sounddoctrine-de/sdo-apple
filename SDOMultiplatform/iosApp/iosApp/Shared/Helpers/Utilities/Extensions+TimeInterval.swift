//
//  Extensions+TimeInterval.swift
//  SDO
//
//  Created by Joel Kingsley on 19/08/2022.
//

import Foundation

extension TimeInterval {
    private var minuteInSeconds: Double { 60.0 }
    private var hourInSeconds: Double { 60.0 * 60.0 }
    private var dayInSeconds: Double { 60.0 * 60.0 * 24.0 }
    private var weekInSeconds: Double { 60.0 * 60.0 * 24.0 * 7.0 }
    private var monthInSeconds: Double { 60.0 * 60.0 * 24.0 * 30.4369 }
    private var yearInSeconds: Double { 60.0 * 60.0 * 24.0 * 365.2422 }
    
    func asMinutes() -> Double { return self / (60.0) }
    func asHours() -> Double { return self / (60.0 * 60.0) }
    func asDays() -> Double { return self / (60.0 * 60.0 * 24.0) }
    func asWeeks() -> Double { return self / (60.0 * 60.0 * 24.0 * 7.0) }
    func asMonths() -> Double { return self / (60.0 * 60.0 * 24.0 * 30.4369) }
    func asYears() -> Double { return self / (60.0 * 60.0 * 24.0 * 365.2422) }
    
    func formattedByLength() -> String {
        if self < minuteInSeconds {
            let seconds = Int(self)
            return "\(seconds) \(String(localized: seconds != 1 ? "seconds" : "second"))"
        } else if self < hourInSeconds {
            let minutes = Int(self / minuteInSeconds)
            return "\(minutes) \(String(localized: minutes != 1 ? "minutes" : "minute"))"
        } else if self < dayInSeconds {
            let hours = Int(self / hourInSeconds)
            return "\(hours) \(String(localized: hours != 1 ? "hours" : "hour"))"
        } else if self < weekInSeconds {
            let days = Int(self / dayInSeconds)
            return "\(days) \(String(localized: days != 1 ? "days" : "day"))"
        } else if self < monthInSeconds {
            let weeks = Int(self / weekInSeconds)
            return "\(weeks) \(String(localized: weeks != 1 ? "weeks" : "week"))"
        } else if self < yearInSeconds {
            let months = Int(self / monthInSeconds)
            return "\(months) \(String(localized: months != 1 ? "months" : "month"))"
        } else {
            let years = Int(self / yearInSeconds)
            return "\(years) \(String(localized: years != 1 ? "years" : "year"))"
        }
    }
}
