@_private(sourceFile: "HomeView.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension HomeView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 109)
        HomeView()
    
#sourceLocation()
    }
}

extension NavigationBarItemView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 92)
        HStack {
            NavigationLink(destination: Text(__designTimeString("#9348.[6].[0].property.[0].[0].arg[0].value.[0].arg[0].value.arg[0].value", fallback: "Profile"))) {
                Image(systemName: __designTimeString("#9348.[6].[0].property.[0].[0].arg[0].value.[0].arg[1].value.[0].arg[0].value", fallback: "person"))
            }
            .padding(.horizontal)
            
            NavigationLink(destination: Text(__designTimeString("#9348.[6].[0].property.[0].[0].arg[0].value.[1].arg[0].value.arg[0].value", fallback: "Settings"))) {
                Image(systemName: __designTimeString("#9348.[6].[0].property.[0].[0].arg[0].value.[1].arg[1].value.[0].arg[0].value", fallback: "gear"))
            }
            .padding(.horizontal)
        }
        .foregroundColor(.blue)
    
#sourceLocation()
    }
}

extension ArticleRow {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 79)
        VStack(alignment: .leading) {
            Text(title)
                .font(.title3)
                .padding()
                .background(Color.gray.opacity(__designTimeFloat("#9348.[5].[1].property.[0].[0].arg[1].value.[0].modifier[2].arg[0].value.modifier[0].arg[0].value", fallback: 0.2)))
                .cornerRadius(__designTimeInteger("#9348.[5].[1].property.[0].[0].arg[1].value.[0].modifier[3].arg[0].value", fallback: 10))
        }
        .padding(.vertical, __designTimeInteger("#9348.[5].[1].property.[0].[0].modifier[0].arg[1].value", fallback: 5))
    
#sourceLocation()
    }
}

extension BodyView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 61)
        VStack(alignment: .leading) {
            Text(__designTimeString("#9348.[4].[0].property.[0].[0].arg[1].value.[0].arg[0].value", fallback: "Latest Articles"))
                .font(.headline)
                .padding(.horizontal)
            
            List {
                ForEach(__designTimeInteger("#9348.[4].[0].property.[0].[0].arg[1].value.[1].arg[0].value.[0].arg[0].value.[0]", fallback: 1)..<__designTimeInteger("#9348.[4].[0].property.[0].[0].arg[1].value.[1].arg[0].value.[0].arg[0].value.[1]", fallback: 6)) { index in
                    ArticleRow(title: "Article \(index)")
                }
            }
        }
    
#sourceLocation()
    }
}

extension DayCard {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 48)
        VStack {
            Text("Day \(day + __designTimeInteger("#9348.[3].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].value.arg[0].value.[0]", fallback: 1))")
                .font(.headline)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(__designTimeInteger("#9348.[3].[1].property.[0].[0].arg[0].value.[0].modifier[4].arg[0].value", fallback: 10))
        }
    
#sourceLocation()
    }
}

extension HeaderView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 27)
        VStack(alignment: .leading) {
            Text(__designTimeString("#9348.[2].[0].property.[0].[0].arg[1].value.[0].arg[0].value", fallback: "This Week's Events"))
                .font(.headline)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: __designTimeBoolean("#9348.[2].[0].property.[0].[0].arg[1].value.[1].arg[1].value", fallback: false)) {
                HStack(spacing: __designTimeInteger("#9348.[2].[0].property.[0].[0].arg[1].value.[1].arg[2].value.[0].arg[0].value", fallback: 10)) {
                    ForEach(__designTimeInteger("#9348.[2].[0].property.[0].[0].arg[1].value.[1].arg[2].value.[0].arg[1].value.[0].arg[0].value.[0]", fallback: 0)..<__designTimeInteger("#9348.[2].[0].property.[0].[0].arg[1].value.[1].arg[2].value.[0].arg[1].value.[0].arg[0].value.[1]", fallback: 7)) { day in
                        DayCard(day: day)
                    }
                }
                .padding(.horizontal)
            }
        }
    
#sourceLocation()
    }
}

extension HomeView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 12)
        NavigationView {
            VStack {
                HeaderView()
                Divider()
                BodyView()
            }
            .navigationTitle(__designTimeString("#9348.[1].[0].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value", fallback: "Home"))
            .navigationBarItems(trailing: NavigationBarItemView())
        }
        .navigationViewStyle(StackNavigationViewStyle())
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.HomeView
import struct ROLOSOFT_FRONT.HeaderView
import struct ROLOSOFT_FRONT.DayCard
import struct ROLOSOFT_FRONT.BodyView
import struct ROLOSOFT_FRONT.ArticleRow
import struct ROLOSOFT_FRONT.NavigationBarItemView
import struct ROLOSOFT_FRONT.HomeView_Previews

