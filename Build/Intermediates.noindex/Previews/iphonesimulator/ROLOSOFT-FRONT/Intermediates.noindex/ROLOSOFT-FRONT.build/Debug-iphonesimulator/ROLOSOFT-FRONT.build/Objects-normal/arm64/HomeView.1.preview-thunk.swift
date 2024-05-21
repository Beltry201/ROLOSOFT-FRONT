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
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 107)
        let authService = AuthService()
        return HomeView(authService: authService)
    
#sourceLocation()
    }
}

extension NavigationBarItemView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 91)
        HStack {
            NavigationLink(destination: Text(__designTimeString("#4993.[7].[0].property.[0].[0].arg[0].value.[0].arg[0].value.arg[0].value", fallback: "Profile"))) {
                Image(systemName: __designTimeString("#4993.[7].[0].property.[0].[0].arg[0].value.[0].arg[1].value.[0].arg[0].value", fallback: "person"))
            }
            .padding(.horizontal)
            
            NavigationLink(destination: Text(__designTimeString("#4993.[7].[0].property.[0].[0].arg[0].value.[1].arg[0].value.arg[0].value", fallback: "Settings"))) {
                Image(systemName: __designTimeString("#4993.[7].[0].property.[0].[0].arg[0].value.[1].arg[1].value.[0].arg[0].value", fallback: "gear"))
            }
            .padding(.horizontal)
        }
    
#sourceLocation()
    }
}

extension BodyView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 63)
        List {
            ForEach(matchCardsData, id: \.id) { match in
                MatchCard(
                    teamA: match.teamA,
                    teamB: match.teamB,
                    dateString: match.dateString
                )
            }
            .listRowBackground(Color.gray.opacity(__designTimeInteger("#4993.[5].[0].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.modifier[0].arg[0].value", fallback: 0)))
            .listRowInsets(.init(
                top: __designTimeInteger("#4993.[5].[0].property.[0].[0].arg[0].value.[0].modifier[1].arg[0].value.arg[0].value", fallback: 0),
                leading: __designTimeInteger("#4993.[5].[0].property.[0].[0].arg[0].value.[0].modifier[1].arg[0].value.arg[1].value", fallback: 0),
                bottom: __designTimeInteger("#4993.[5].[0].property.[0].[0].arg[0].value.[0].modifier[1].arg[0].value.arg[2].value", fallback: 8),
                trailing: __designTimeInteger("#4993.[5].[0].property.[0].[0].arg[0].value.[0].modifier[1].arg[0].value.arg[3].value", fallback: 0))
            )
        }
    
#sourceLocation()
    }
}

extension HeaderView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 37)
        VStack(alignment: .center) {
            HStack {
                
                Image(__designTimeString("#4993.[4].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[0].arg[0].value", fallback: "frisa-logox4"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: __designTimeInteger("#4993.[4].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[2].arg[0].value", fallback: 30))
                Spacer()
                
                Image(systemName: __designTimeString("#4993.[4].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[2].arg[0].value", fallback: "bell"))
                    .font(.title)
                    .foregroundColor(.blue)
            }
            .padding(.horizontal)
    
            CalendarComponent().padding()
            
            MatchCard(teamA: teamA, teamB: teamB, dateString: __designTimeString("#4993.[4].[0].property.[0].[0].arg[1].value.[2].arg[2].value", fallback: "4:00 PM"), isMyMatch: __designTimeBoolean("#4993.[4].[0].property.[0].[0].arg[1].value.[2].arg[3].value", fallback: true))
                .padding(.horizontal)
        }
        .padding(.bottom)
    
#sourceLocation()
    }
}

extension HomeView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 26)
        NavigationView {
            VStack {
                HeaderView()
                BodyView()
            }
        }
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.HomeView
import struct ROLOSOFT_FRONT.HeaderView
import struct ROLOSOFT_FRONT.BodyView
import struct ROLOSOFT_FRONT.NavigationBarItemView
import struct ROLOSOFT_FRONT.HomeView_Previews

