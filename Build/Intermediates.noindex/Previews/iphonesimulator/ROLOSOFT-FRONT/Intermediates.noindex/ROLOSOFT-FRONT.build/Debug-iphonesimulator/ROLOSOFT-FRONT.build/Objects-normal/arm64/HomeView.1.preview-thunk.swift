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
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 90)
        HomeView()
    
#sourceLocation()
    }
}

extension NavigationBarItemView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 73)
        HStack {
            NavigationLink(destination: Text(__designTimeString("#6132.[5].[0].property.[0].[0].arg[0].value.[0].arg[0].value.arg[0].value", fallback: "Profile"))) {
                Image(systemName: __designTimeString("#6132.[5].[0].property.[0].[0].arg[0].value.[0].arg[1].value.[0].arg[0].value", fallback: "person"))
            }
            .padding(.horizontal)
            
            NavigationLink(destination: Text(__designTimeString("#6132.[5].[0].property.[0].[0].arg[0].value.[1].arg[0].value.arg[0].value", fallback: "Settings"))) {
                Image(systemName: __designTimeString("#6132.[5].[0].property.[0].[0].arg[0].value.[1].arg[1].value.[0].arg[0].value", fallback: "gear"))
            }
            .padding(.horizontal)
        }
        .foregroundColor(.blue)
    
#sourceLocation()
    }
}

extension ArticleRow {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 60)
        VStack(alignment: .leading) {
            Text(title)
                .font(.title3)
                .padding()
                .background(Color.gray.opacity(__designTimeFloat("#6132.[4].[1].property.[0].[0].arg[1].value.[0].modifier[2].arg[0].value.modifier[0].arg[0].value", fallback: 0.2)))
                .cornerRadius(__designTimeInteger("#6132.[4].[1].property.[0].[0].arg[1].value.[0].modifier[3].arg[0].value", fallback: 10))
        }
        .padding(.vertical, __designTimeInteger("#6132.[4].[1].property.[0].[0].modifier[0].arg[1].value", fallback: 5))
    
#sourceLocation()
    }
}

extension BodyView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 46)
        VStack(alignment: .leading) {
            List {
                ForEach(__designTimeInteger("#6132.[3].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[0].arg[0].value.[0]", fallback: 1)..<__designTimeInteger("#6132.[3].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[0].arg[0].value.[1]", fallback: 6)) { index in
                    ArticleRow(title: "Article \(index)")
                }
            }
        }
    
#sourceLocation()
    }
}

extension HeaderView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 24)
        VStack(alignment: .leading) {
            HStack {
                // Logo view
                Image(__designTimeString("#6132.[2].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[0].arg[0].value", fallback: "frisa-logox4"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: __designTimeInteger("#6132.[2].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[2].arg[0].value", fallback: 30))
                Spacer()
                // Notifications icon view
                Image(systemName: __designTimeString("#6132.[2].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[2].arg[0].value", fallback: "bell"))
                    .font(.title)
                    .foregroundColor(.blue) // Customize color as needed
            }
            .padding(.horizontal)
            
            CalendarComponent().padding()
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
                BodyView()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.HomeView
import struct ROLOSOFT_FRONT.HeaderView
import struct ROLOSOFT_FRONT.BodyView
import struct ROLOSOFT_FRONT.ArticleRow
import struct ROLOSOFT_FRONT.NavigationBarItemView
import struct ROLOSOFT_FRONT.HomeView_Previews

