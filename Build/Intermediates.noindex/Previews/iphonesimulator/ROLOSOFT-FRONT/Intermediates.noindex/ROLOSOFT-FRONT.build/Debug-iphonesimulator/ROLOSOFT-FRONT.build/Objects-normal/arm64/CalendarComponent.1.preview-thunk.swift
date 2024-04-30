@_private(sourceFile: "CalendarComponent.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import Foundation
import SwiftUI

extension Date {
    @_dynamicReplacement(for: dayOfMonth()) private func __preview__dayOfMonth() -> Int {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/CalendarComponent.swift", line: 90)
            let calendar = Calendar.current
            return calendar.component(.day, from: self)
        
#sourceLocation()
    }
}

extension Date {
    @_dynamicReplacement(for: dayOfWeek()) private func __preview__dayOfWeek() -> String {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/CalendarComponent.swift", line: 85)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = __designTimeString("#10884.[3].[3].[1].[0]", fallback: "E")
        return dateFormatter.string(from: self)
    
#sourceLocation()
    }
}

extension Date {
    @_dynamicReplacement(for: daysOfMonth()) private func __preview__daysOfMonth() -> [String] {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/CalendarComponent.swift", line: 79)
            let calendar = Calendar.current
            let range = calendar.range(of: .day, in: .month, for: self)!
            let days = range.lowerBound..<range.upperBound
            return days.map { String($0) }
    
#sourceLocation()
    }
}

extension Date {
    @_dynamicReplacement(for: daysOfWeek()) private func __preview__daysOfWeek() -> [String] {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/CalendarComponent.swift", line: 74)
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: __designTimeString("#10884.[3].[1].[1].[0]", fallback: "en_US_POSIX"))
            return dateFormatter.shortWeekdaySymbols
    
#sourceLocation()
    }
}

extension Date {
    @_dynamicReplacement(for: monthName()) private func __preview__monthName() -> String {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/CalendarComponent.swift", line: 69)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = __designTimeString("#10884.[3].[0].[1].[0]", fallback: "MMMM")
        return dateFormatter.string(from: self)
    
#sourceLocation()
    }
}

extension CalendarComponent {
    @_dynamicReplacement(for: daysOfWeek(currentDate:)) private func __preview__daysOfWeek(currentDate: Date) -> [Date] {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/CalendarComponent.swift", line: 60)
        let calendar = Calendar.current
        let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: currentDate))
        let days = (__designTimeInteger("#10884.[2].[2].[2].value.[0].[0]", fallback: 0)..<__designTimeInteger("#10884.[2].[2].[2].value.[0].[1]", fallback: 7)).compactMap { calendar.date(byAdding: .day, value: $0, to: startOfWeek!) }
        return days
    
#sourceLocation()
    }
}

extension CalendarComponent {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/CalendarComponent.swift", line: 16)
        VStack(spacing: __designTimeInteger("#10884.[2].[1].property.[0].[0].arg[0].value", fallback: 0)) {
            // Month and navigation buttons
            HStack {
                Text(currentDate.monthName())
                    .font(.custom(__designTimeString("#10884.[2].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value", fallback: "Montserrat-Regular"), size: __designTimeInteger("#10884.[2].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[0].arg[0].value.arg[1].value", fallback: 36)))
                Spacer()
                Button(action: {
                    // Previous week action
                    currentDate = Calendar.current.date(byAdding: .weekOfMonth, value: __designTimeInteger("#10884.[2].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[2].arg[0].value.[0].[0]", fallback: -1), to: currentDate) ?? currentDate
                }) {
                    Image(systemName: __designTimeString("#10884.[2].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[2].arg[1].value.[0].arg[0].value", fallback: "chevron.left"))
                }
                
                Button(action: {
                    // Next week action
                    currentDate = Calendar.current.date(byAdding: .weekOfMonth, value: __designTimeInteger("#10884.[2].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[3].arg[0].value.[0].[0]", fallback: 1), to: currentDate) ?? currentDate
                }) {
                    Image(systemName: __designTimeString("#10884.[2].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[3].arg[1].value.[0].arg[0].value", fallback: "chevron.right"))
                }
            }
            
            Divider().padding(.vertical, __designTimeInteger("#10884.[2].[1].property.[0].[0].arg[1].value.[1].modifier[0].arg[1].value", fallback: 8))
            
            // Days of the month
            HStack(spacing: __designTimeInteger("#10884.[2].[1].property.[0].[0].arg[1].value.[2].arg[0].value", fallback: 0)) {
                ForEach(daysOfWeek(currentDate: currentDate), id: \.self) { day in
                    VStack {
                        Text(day.dayOfWeek())
                            .font(.caption)
                            .fixedSize(horizontal: __designTimeBoolean("#10884.[2].[1].property.[0].[0].arg[1].value.[2].arg[1].value.[0].arg[2].value.[0].arg[0].value.[0].modifier[1].arg[0].value", fallback: true), vertical: __designTimeBoolean("#10884.[2].[1].property.[0].[0].arg[1].value.[2].arg[1].value.[0].arg[2].value.[0].arg[0].value.[0].modifier[1].arg[1].value", fallback: false)) // Prevents wrapping
                        
                        Text("\(day.dayOfMonth())")
                            .font(.subheadline)
                            .fixedSize(horizontal: __designTimeBoolean("#10884.[2].[1].property.[0].[0].arg[1].value.[2].arg[1].value.[0].arg[2].value.[0].arg[0].value.[1].modifier[1].arg[0].value", fallback: true), vertical: __designTimeBoolean("#10884.[2].[1].property.[0].[0].arg[1].value.[2].arg[1].value.[0].arg[2].value.[0].arg[0].value.[1].modifier[1].arg[1].value", fallback: false))
                    }
                    .padding(.horizontal)
                }
            }
            .frame(width: .infinity)
        }
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.CalendarComponent

