@_private(sourceFile: "HomeView.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeSelection
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
        __designTimeSelection(HomeView(), "#6132.[6].[0].property.[0].[0]")
    
#sourceLocation()
    }
}

extension NavigationBarItemView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 73)
        __designTimeSelection(HStack {
            __designTimeSelection(NavigationLink(destination: __designTimeSelection(Text(__designTimeString("#6132.[5].[0].property.[0].[0].arg[0].value.[0].arg[0].value.arg[0].value", fallback: "Profile")), "#6132.[5].[0].property.[0].[0].arg[0].value.[0].arg[0].value")) {
                __designTimeSelection(Image(systemName: __designTimeString("#6132.[5].[0].property.[0].[0].arg[0].value.[0].arg[1].value.[0].arg[0].value", fallback: "person")), "#6132.[5].[0].property.[0].[0].arg[0].value.[0].arg[1].value.[0]")
            }
            .padding(.horizontal), "#6132.[5].[0].property.[0].[0].arg[0].value.[0]")
            
            __designTimeSelection(NavigationLink(destination: __designTimeSelection(Text(__designTimeString("#6132.[5].[0].property.[0].[0].arg[0].value.[1].arg[0].value.arg[0].value", fallback: "Settings")), "#6132.[5].[0].property.[0].[0].arg[0].value.[1].arg[0].value")) {
                __designTimeSelection(Image(systemName: __designTimeString("#6132.[5].[0].property.[0].[0].arg[0].value.[1].arg[1].value.[0].arg[0].value", fallback: "gear")), "#6132.[5].[0].property.[0].[0].arg[0].value.[1].arg[1].value.[0]")
            }
            .padding(.horizontal), "#6132.[5].[0].property.[0].[0].arg[0].value.[1]")
        }
        .foregroundColor(.blue), "#6132.[5].[0].property.[0].[0]")
    
#sourceLocation()
    }
}

extension ArticleRow {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 60)
        __designTimeSelection(VStack(alignment: .leading) {
            __designTimeSelection(Text(__designTimeSelection(title, "#6132.[4].[1].property.[0].[0].arg[1].value.[0].arg[0].value"))
                .font(.title3)
                .padding()
                .background(__designTimeSelection(Color.gray.opacity(__designTimeFloat("#6132.[4].[1].property.[0].[0].arg[1].value.[0].modifier[2].arg[0].value.modifier[0].arg[0].value", fallback: 0.2)), "#6132.[4].[1].property.[0].[0].arg[1].value.[0].modifier[2].arg[0].value"))
                .cornerRadius(__designTimeInteger("#6132.[4].[1].property.[0].[0].arg[1].value.[0].modifier[3].arg[0].value", fallback: 10)), "#6132.[4].[1].property.[0].[0].arg[1].value.[0]")
        }
        .padding(.vertical, __designTimeInteger("#6132.[4].[1].property.[0].[0].modifier[0].arg[1].value", fallback: 5)), "#6132.[4].[1].property.[0].[0]")
    
#sourceLocation()
    }
}

extension BodyView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 46)
        __designTimeSelection(VStack(alignment: .leading) {
            __designTimeSelection(List {
                __designTimeSelection(ForEach(__designTimeInteger("#6132.[3].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[0].arg[0].value.[0]", fallback: 1)..<__designTimeInteger("#6132.[3].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[0].arg[0].value.[1]", fallback: 6)) { index in
                    __designTimeSelection(ArticleRow(title: "Article \(__designTimeSelection(index, "#6132.[3].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[0].arg[1].value.[0].arg[0].value.[1].value.arg[0].value"))"), "#6132.[3].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[0].arg[1].value.[0]")
                }, "#6132.[3].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[0]")
            }, "#6132.[3].[0].property.[0].[0].arg[1].value.[0]")
        }, "#6132.[3].[0].property.[0].[0]")
    
#sourceLocation()
    }
}

extension HeaderView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 24)
        __designTimeSelection(VStack(alignment: .leading) {
            __designTimeSelection(HStack {
                // Logo view
                __designTimeSelection(Image(__designTimeString("#6132.[2].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[0].arg[0].value", fallback: "frisa-logox4"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: .infinity, height: __designTimeInteger("#6132.[2].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[2].arg[1].value", fallback: 30)), "#6132.[2].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[0]")
                __designTimeSelection(Spacer(), "#6132.[2].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[1]")
                // Notifications icon view
                __designTimeSelection(Image(systemName: __designTimeString("#6132.[2].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[2].arg[0].value", fallback: "bell"))
                    .font(.title)
                    .foregroundColor(.blue), "#6132.[2].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[2]") // Customize color as needed
            }
            .padding(.horizontal), "#6132.[2].[0].property.[0].[0].arg[1].value.[0]")
            
            __designTimeSelection(CalendarComponent().padding(), "#6132.[2].[0].property.[0].[0].arg[1].value.[1]")
        }, "#6132.[2].[0].property.[0].[0]")
    
#sourceLocation()
    }
}

extension HomeView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 12)
        __designTimeSelection(NavigationView {
            __designTimeSelection(VStack {
                __designTimeSelection(HeaderView(), "#6132.[1].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[0]")
                __designTimeSelection(BodyView(), "#6132.[1].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[1]")
            }, "#6132.[1].[0].property.[0].[0].arg[0].value.[0]")
        }
        .navigationViewStyle(__designTimeSelection(StackNavigationViewStyle(), "#6132.[1].[0].property.[0].[0].modifier[0].arg[0].value")), "#6132.[1].[0].property.[0].[0]")
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.HomeView
import struct ROLOSOFT_FRONT.HeaderView
import struct ROLOSOFT_FRONT.BodyView
import struct ROLOSOFT_FRONT.ArticleRow
import struct ROLOSOFT_FRONT.NavigationBarItemView
import struct ROLOSOFT_FRONT.HomeView_Previews

