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
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 126)
        let authService = AuthService() // Create an instance of AuthService
        return HomeView(authService: authService) // Pass authService to HomeView
    
#sourceLocation()
    }
}

extension LogoutButton {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 110)
        Button(action: {
            authService.logOut() // Call logOut method from AuthService
            presentationMode.wrappedValue.dismiss() // Dismiss the current view
        }) {
            Text(__designTimeString("#4707.[6].[2].property.[0].[0].arg[1].value.[0].arg[0].value", fallback: "Logout"))
                .foregroundColor(.red)
                .padding()
                .background(Color.gray.opacity(__designTimeFloat("#4707.[6].[2].property.[0].[0].arg[1].value.[0].modifier[2].arg[0].value.modifier[0].arg[0].value", fallback: 0.2)))
                .cornerRadius(__designTimeInteger("#4707.[6].[2].property.[0].[0].arg[1].value.[0].modifier[3].arg[0].value", fallback: 10))
        }
        .padding()
    
#sourceLocation()
    }
}

extension NavigationBarItemView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 91)
        HStack {
            NavigationLink(destination: Text(__designTimeString("#4707.[5].[0].property.[0].[0].arg[0].value.[0].arg[0].value.arg[0].value", fallback: "Profile"))) {
                Image(systemName: __designTimeString("#4707.[5].[0].property.[0].[0].arg[0].value.[0].arg[1].value.[0].arg[0].value", fallback: "person"))
            }
            .padding(.horizontal)
            
            NavigationLink(destination: Text(__designTimeString("#4707.[5].[0].property.[0].[0].arg[0].value.[1].arg[0].value.arg[0].value", fallback: "Settings"))) {
                Image(systemName: __designTimeString("#4707.[5].[0].property.[0].[0].arg[0].value.[1].arg[1].value.[0].arg[0].value", fallback: "gear"))
            }
            .padding(.horizontal)
        }
    
#sourceLocation()
    }
}

extension BodyView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 68)
        List {
            ForEach(newsData, id: \.title) { news in
                NewsCard(
                    title: news.title,
                    date: news.date,
                    desc: news.desc,
                    imgUrl: news.imgUrl
                )
            }
        }
    
#sourceLocation()
    }
}

extension HeaderView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 27)
        VStack(alignment: .center) {
            HStack {
                // Logo view
                Image(__designTimeString("#4707.[2].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[0].arg[0].value", fallback: "frisa-logox4"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: __designTimeInteger("#4707.[2].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[2].arg[0].value", fallback: 30))
                Spacer()
                // Notifications icon view
                Image(systemName: __designTimeString("#4707.[2].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[2].arg[0].value", fallback: "bell"))
                    .font(.title)
                    .foregroundColor(.blue) // Customize color as needed
            }
            .padding(.horizontal)
    
            CalendarComponent().padding()
            
            // Create dummy team data
            let teamA = ScoreCardTeamData(
                name: __designTimeString("#4707.[2].[0].property.[0].[0].arg[1].value.[2].value.arg[0].value", fallback: "IDS"),
                logo: __designTimeString("#4707.[2].[0].property.[0].[0].arg[1].value.[2].value.arg[1].value", fallback: "https://upload.wikimedia.org/wikipedia/commons/5/58/Escudo_de_Independiente_Santa_Fe.png"),
                score: __designTimeInteger("#4707.[2].[0].property.[0].[0].arg[1].value.[2].value.arg[2].value", fallback: 2)
            )
            
            let teamB = ScoreCardTeamData(
                name: __designTimeString("#4707.[2].[0].property.[0].[0].arg[1].value.[3].value.arg[0].value", fallback: "AN"),
                logo: __designTimeString("#4707.[2].[0].property.[0].[0].arg[1].value.[3].value.arg[1].value", fallback: "https://upload.wikimedia.org/wikipedia/commons/d/d7/Atlético_Nacional.png"),
                score: __designTimeInteger("#4707.[2].[0].property.[0].[0].arg[1].value.[3].value.arg[2].value", fallback: 1)
            )
            
            // Use the ScoreCard with dummy data
            ScoreCard(teamA: teamA, teamB: teamB)
                .padding(.horizontal)
        }
        .padding(.bottom)
    
#sourceLocation()
    }
}

extension HomeView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 15)
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
import struct ROLOSOFT_FRONT.NavigationBarItemView
import struct ROLOSOFT_FRONT.LogoutButton
import struct ROLOSOFT_FRONT.HomeView_Previews

