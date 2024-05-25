@_private(sourceFile: "MatchCalendar.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension Date {
    @_dynamicReplacement(for: dayOfMonth()) private func __preview__dayOfMonth() -> Int {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/MatchCalendar.swift", line: 124)
        let calendar = Calendar.current
        return calendar.component(.day, from: self)
    
#sourceLocation()
    }
}

extension Date {
    @_dynamicReplacement(for: dayOfWeek()) private func __preview__dayOfWeek() -> String {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/MatchCalendar.swift", line: 118)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = __designTimeString("#9093.[2].[1].[1].[0]", fallback: "E")
        return dateFormatter.string(from: self)
    
#sourceLocation()
    }
}

extension Date {
    @_dynamicReplacement(for: monthName()) private func __preview__monthName() -> String {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/MatchCalendar.swift", line: 112)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = __designTimeString("#9093.[2].[0].[1].[0]", fallback: "MMMM")
        return dateFormatter.string(from: self)
    
#sourceLocation()
    }
}

extension MatchCalendar {
    @_dynamicReplacement(for: isSelected(_:)) private func __preview__isSelected(_ date: Date) -> Bool {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/MatchCalendar.swift", line: 106)
        Calendar.current.isDate(selectedDate, inSameDayAs: date)
    
#sourceLocation()
    }
}

extension MatchCalendar {
    @_dynamicReplacement(for: hasEvent(on:)) private func __preview__hasEvent(on date: Date) -> Bool {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/MatchCalendar.swift", line: 100)
        return events.contains { event in
            Calendar.current.isDate(event.dateStart, inSameDayAs: date)
        }
    
#sourceLocation()
    }
}

extension MatchCalendar {
    @_dynamicReplacement(for: daysOfWeek(currentDate:)) private func __preview__daysOfWeek(currentDate: Date) -> [Date] {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/MatchCalendar.swift", line: 91)
        let calendar = Calendar.current
        let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: currentDate))
        let days = (__designTimeInteger("#9093.[1].[4].[2].value.[0].[0]", fallback: 0)..<__designTimeInteger("#9093.[1].[4].[2].value.[0].[1]", fallback: 7)).map { index in
            calendar.date(byAdding: .day, value: index, to: startOfWeek!) ?? Date()
        }
        return days
    
#sourceLocation()
    }
}

extension MatchCalendar {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/MatchCalendar.swift", line: 16)
        VStack(spacing: __designTimeInteger("#9093.[1].[3].property.[0].[0].arg[0].value", fallback: 0)) {
            // Month and navigation buttons
            HStack {
                Text(currentDate.monthName())
                    .font(.custom(__designTimeString("#9093.[1].[3].property.[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value", fallback: "Montserrat-Regular"), size: __designTimeInteger("#9093.[1].[3].property.[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[0].arg[0].value.arg[1].value", fallback: 36)))
                Spacer()
                Button(action: {
                    // Previous week action
                    self.currentDate = Calendar.current.date(byAdding: .weekOfMonth, value: __designTimeInteger("#9093.[1].[3].property.[0].[0].arg[1].value.[0].arg[0].value.[2].arg[0].value.[0].[0]", fallback: -1), to: self.currentDate) ?? self.currentDate
                }) {
                    Image(systemName: __designTimeString("#9093.[1].[3].property.[0].[0].arg[1].value.[0].arg[0].value.[2].arg[1].value.[0].arg[0].value", fallback: "chevron.left"))
                }
                
                Button(action: {
                    // Next week action
                    self.currentDate = Calendar.current.date(byAdding: .weekOfMonth, value: __designTimeInteger("#9093.[1].[3].property.[0].[0].arg[1].value.[0].arg[0].value.[3].arg[0].value.[0].[0]", fallback: 1), to: self.currentDate) ?? self.currentDate
                }) {
                    Image(systemName: __designTimeString("#9093.[1].[3].property.[0].[0].arg[1].value.[0].arg[0].value.[3].arg[1].value.[0].arg[0].value", fallback: "chevron.right"))
                }
            }
            
            Divider().padding(.vertical, __designTimeInteger("#9093.[1].[3].property.[0].[0].arg[1].value.[1].modifier[0].arg[1].value", fallback: 8))
            
            // Days of the month
            HStack(spacing: __designTimeInteger("#9093.[1].[3].property.[0].[0].arg[1].value.[2].arg[0].value", fallback: 0)) {
                ForEach(daysOfWeek(currentDate: self.currentDate), id: \.self) { day in
                    VStack(spacing: __designTimeInteger("#9093.[1].[3].property.[0].[0].arg[1].value.[2].arg[1].value.[0].arg[2].value.[0].arg[0].value", fallback: 10)) {
                        if self.hasEvent(on: day) {
                            Text(day.dayOfWeek())
                                .font(.caption)
                                .fixedSize(horizontal: __designTimeBoolean("#9093.[1].[3].property.[0].[0].arg[1].value.[2].arg[1].value.[0].arg[2].value.[0].arg[1].value.[0].[0].[0].modifier[1].arg[0].value", fallback: true), vertical: __designTimeBoolean("#9093.[1].[3].property.[0].[0].arg[1].value.[2].arg[1].value.[0].arg[2].value.[0].arg[1].value.[0].[0].[0].modifier[1].arg[1].value", fallback: false))
                            Text("\(day.dayOfMonth())")
                                .foregroundColor(.white)
                                .font(.subheadline)
                                .fixedSize(horizontal: __designTimeBoolean("#9093.[1].[3].property.[0].[0].arg[1].value.[2].arg[1].value.[0].arg[2].value.[0].arg[1].value.[0].[0].[1].modifier[2].arg[0].value", fallback: true), vertical: __designTimeBoolean("#9093.[1].[3].property.[0].[0].arg[1].value.[2].arg[1].value.[0].arg[2].value.[0].arg[1].value.[0].[0].[1].modifier[2].arg[1].value", fallback: false))
                                .background(
                                    Circle()
                                        .fill(
                                            LinearGradient(
                                                gradient: Gradient(colors: [Color.red, Color.orange]),
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            )
                                        )
                                        .frame(width: __designTimeInteger("#9093.[1].[3].property.[0].[0].arg[1].value.[2].arg[1].value.[0].arg[2].value.[0].arg[1].value.[0].[0].[1].modifier[3].arg[0].value.modifier[1].arg[0].value", fallback: 32), height: __designTimeInteger("#9093.[1].[3].property.[0].[0].arg[1].value.[2].arg[1].value.[0].arg[2].value.[0].arg[1].value.[0].[0].[1].modifier[3].arg[0].value.modifier[1].arg[1].value", fallback: 32)) // Adjust the size of the circle
                                        .overlay(
                                            Circle()
                                                .stroke(Color.blue, lineWidth: self.isSelected(day) ? __designTimeInteger("#9093.[1].[3].property.[0].[0].arg[1].value.[2].arg[1].value.[0].arg[2].value.[0].arg[1].value.[0].[0].[1].modifier[3].arg[0].value.modifier[2].arg[0].value.modifier[0].arg[1].value.then", fallback: 2) : __designTimeInteger("#9093.[1].[3].property.[0].[0].arg[1].value.[2].arg[1].value.[0].arg[2].value.[0].arg[1].value.[0].[0].[1].modifier[3].arg[0].value.modifier[2].arg[0].value.modifier[0].arg[1].value.else", fallback: 0))
                                        )
                                )
                                .onTapGesture {
                                    self.selectedDate = day
                                }
                        } else {
                            Text(day.dayOfWeek())
                                .font(.caption)
                                .fixedSize(horizontal: __designTimeBoolean("#9093.[1].[3].property.[0].[0].arg[1].value.[2].arg[1].value.[0].arg[2].value.[0].arg[1].value.[0].[1].[0].modifier[1].arg[0].value", fallback: true), vertical: __designTimeBoolean("#9093.[1].[3].property.[0].[0].arg[1].value.[2].arg[1].value.[0].arg[2].value.[0].arg[1].value.[0].[1].[0].modifier[1].arg[1].value", fallback: false))
                            
                            Text("\(day.dayOfMonth())")
                                .font(.subheadline)
                                .fixedSize(horizontal: __designTimeBoolean("#9093.[1].[3].property.[0].[0].arg[1].value.[2].arg[1].value.[0].arg[2].value.[0].arg[1].value.[0].[1].[1].modifier[1].arg[0].value", fallback: true), vertical: __designTimeBoolean("#9093.[1].[3].property.[0].[0].arg[1].value.[2].arg[1].value.[0].arg[2].value.[0].arg[1].value.[0].[1].[1].modifier[1].arg[1].value", fallback: false))
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
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.MatchCalendar

