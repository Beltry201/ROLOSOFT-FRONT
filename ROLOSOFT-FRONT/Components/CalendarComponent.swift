//
//  CalendarComponent.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 29/04/24.
//

import SwiftUI
import Foundation

struct CalendarComponent: View {
    // Properties
    @State private var currentDate = Date()
    
    var body: some View {
        VStack(spacing: 0) {
            // Month and navigation buttons
            HStack {
                Text(currentDate.monthName())
                    .font(.custom("Montserrat-Regular", size: 36))
                Spacer()
                Button(action: {
                    // Previous week action
                    currentDate = Calendar.current.date(byAdding: .weekOfMonth, value: -1, to: currentDate) ?? currentDate
                }) {
                    Image(systemName: "chevron.left")
                }
                
                Button(action: {
                    // Next week action
                    currentDate = Calendar.current.date(byAdding: .weekOfMonth, value: 1, to: currentDate) ?? currentDate
                }) {
                    Image(systemName: "chevron.right")
                }
            }
            
            Divider().padding(.vertical, 8)
            
            // Days of the month
            HStack(spacing: 0) {
                ForEach(daysOfWeek(currentDate: currentDate), id: \.self) { day in
                    VStack {
                        Text(day.dayOfWeek())
                            .font(.caption)
                            .fixedSize(horizontal: true, vertical: false)
                        
                        Text("\(day.dayOfMonth())")
                            .font(.subheadline)
                            .fixedSize(horizontal: true, vertical: false)
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
    
    // Helper functions
    private func daysOfWeek(currentDate: Date) -> [Date] {
        let calendar = Calendar.current
        let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: currentDate))
        let days = (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: startOfWeek!) }
        return days
    }
}

extension Date {
    func monthName() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
    func daysOfWeek() -> [String] {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            return dateFormatter.shortWeekdaySymbols
    }
    func daysOfMonth() -> [String] {
            let calendar = Calendar.current
            let range = calendar.range(of: .day, in: .month, for: self)!
            let days = range.lowerBound..<range.upperBound
            return days.map { String($0) }
    }
    func dayOfWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E"
        return dateFormatter.string(from: self)
    }
    func dayOfMonth() -> Int {
            let calendar = Calendar.current
            return calendar.component(.day, from: self)
        }
}

