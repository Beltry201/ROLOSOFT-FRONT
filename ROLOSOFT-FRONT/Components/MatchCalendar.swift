//
//  CalendarComponent.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 29/04/24.
//

import SwiftUI

struct MatchCalendar: View {
    @Binding var selectedDate: Date
    @State private var currentDate = Date()
    var events: [MatchEvent]
    
    var body: some View {
        VStack(spacing: 0) {
            // Month and navigation buttons
            HStack {
                Text(currentDate.monthName())
                    .font(.custom("Montserrat-Regular", size: 36))
                Spacer()
                Button(action: {
                    // Previous week action
                    self.currentDate = Calendar.current.date(byAdding: .weekOfMonth, value: -1, to: self.currentDate) ?? self.currentDate
                }) {
                    Image(systemName: "chevron.left")
                }
                
                Button(action: {
                    // Next week action
                    self.currentDate = Calendar.current.date(byAdding: .weekOfMonth, value: 1, to: self.currentDate) ?? self.currentDate
                }) {
                    Image(systemName: "chevron.right")
                }
            }
            
            Divider().padding(.vertical, 8)
            
            // Days of the month
            HStack(spacing: 0) {
                ForEach(daysOfWeek(currentDate: self.currentDate), id: \.self) { day in
                    VStack(spacing: 10) {
                        if self.hasEvent(on: day) {
                            Text(day.dayOfWeek())
                                .font(.caption)
                                .fixedSize(horizontal: true, vertical: false)
                            Text("\(day.dayOfMonth())")
                                .foregroundColor(.white)
                                .font(.subheadline)
                                .fixedSize(horizontal: true, vertical: false)
                                .background(
                                    Circle()
                                        .fill(
                                            LinearGradient(
                                                gradient: Gradient(colors: [Color.red, Color.orange]),
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            )
                                        )
                                        .frame(width: 32, height: 32) // Adjust the size of the circle
                                        .overlay(
                                            Circle()
                                                .stroke(Color.blue, lineWidth: self.isSelected(day) ? 2 : 0)
                                        )
                                )
                                .onTapGesture {
                                    self.selectedDate = day
                                }
                        } else {
                            Text(day.dayOfWeek())
                                .font(.caption)
                                .fixedSize(horizontal: true, vertical: false)
                            
                            Text("\(day.dayOfMonth())")
                                .font(.subheadline)
                                .fixedSize(horizontal: true, vertical: false)
                                .foregroundColor(self.isSelected(day) ? .blue : .black)
                                .onTapGesture {
                                    self.selectedDate = day
                                }
                        }
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
        let days = (0..<7).map { index in
            calendar.date(byAdding: .day, value: index, to: startOfWeek!) ?? Date()
        }
        return days
    }
    
    private func hasEvent(on date: Date) -> Bool {
        return events.contains { event in
            Calendar.current.isDate(event.dateStart, inSameDayAs: date)
        }
    }
    
    private func isSelected(_ date: Date) -> Bool {
        Calendar.current.isDate(selectedDate, inSameDayAs: date)
    }
}

extension Date {
    func monthName() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
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
