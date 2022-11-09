//
//  CustomPatterns+DateFormatter.swift
//  LearningTask-6.2
//
//  Created by jeovane.barbosa on 09/11/22.
//

import Foundation

extension DateFormatter {
    
    private static var dayPlusAbbreviatedMonthFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = .init(identifier: "pt_BR")
        formatter.dateFormat = "dd MMM"
        
        return formatter
    }()
    
    
    enum CustomPattern {
        case dayPlusAbbreviatedMonth
        
        var formatter: DateFormatter {
            switch self {
            case .dayPlusAbbreviatedMonth:
                return DateFormatter.dayPlusAbbreviatedMonthFormatter
            }
        }
    }
    
    static func format(date: Date, to customPattern: CustomPattern) -> String {
        customPattern.formatter.string(from: date).uppercased()
    }
    
}

extension Date{
    typealias FormattedText = String
    
    var asDayPlusAbbreviatedMonth: FormattedText {
        return DateFormatter.format(date: self, to: .dayPlusAbbreviatedMonth)
    }
}

extension NumberFormatter {
    
    private static var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter
    }()
    
    static func formatToCurrency(decimal: Decimal) -> String {
        return currencyFormatter.string(from: decimal as NSDecimalNumber)!
    }
}

extension Decimal {
    typealias FormattedText = String
    var asCurrency: FormattedText {
        return NumberFormatter.formatToCurrency(decimal: self)
    }
}

