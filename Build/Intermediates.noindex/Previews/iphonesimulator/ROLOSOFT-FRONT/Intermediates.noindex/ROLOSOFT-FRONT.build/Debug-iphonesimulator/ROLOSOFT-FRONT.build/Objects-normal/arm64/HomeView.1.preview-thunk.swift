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
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 187)
        let apiService = APIService() // Initialize APIService instance
        let authService = AuthService()
        return HomeView(authService: authService, apiService: apiService)
    
#sourceLocation()
    }
}

extension NavigationBarItemView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 171)
        HStack {
            NavigationLink(destination: Text(__designTimeString("#2453.[7].[0].property.[0].[0].arg[0].value.[0].arg[0].value.arg[0].value", fallback: "Profile"))) {
                Image(systemName: __designTimeString("#2453.[7].[0].property.[0].[0].arg[0].value.[0].arg[1].value.[0].arg[0].value", fallback: "person"))
            }
            .padding(.horizontal)
            
            NavigationLink(destination: Text(__designTimeString("#2453.[7].[0].property.[0].[0].arg[0].value.[1].arg[0].value.arg[0].value", fallback: "Settings"))) {
                Image(systemName: __designTimeString("#2453.[7].[0].property.[0].[0].arg[0].value.[1].arg[1].value.[0].arg[0].value", fallback: "gear"))
            }
            .padding(.horizontal)
        }
    
#sourceLocation()
    }
}

extension BodyView {
    @_dynamicReplacement(for: formatDate(_:)) private func __preview__formatDate(_ date: Date) -> String {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 154)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = __designTimeString("#2453.[5].[4].[1].[0]", fallback: "h:mm a")
        return dateFormatter.string(from: date)
    
#sourceLocation()
    }
}

extension BodyView {
    @_dynamicReplacement(for: filteredEvents) private var __preview__filteredEvents: [MatchEvent] {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 148)
        events.filter { event in
            Calendar.current.isDate(event.dateTimeStart, inSameDayAs: selectedDate)
        }
    
#sourceLocation()
    }
}

extension BodyView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 112)
        VStack {
            if filteredEvents.isEmpty {
                List {
                    Text(__designTimeString("#2453.[5].[2].property.[0].[0].arg[0].value.[0].[0].[0].arg[0].value.[0].arg[0].value", fallback: "No hay partidos programados."))
                        .foregroundColor(.gray)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .listRowBackground(Color.white)
                .listRowInsets(.init(
                    top: __designTimeInteger("#2453.[5].[2].property.[0].[0].arg[0].value.[0].[0].[0].modifier[1].arg[0].value.arg[0].value", fallback: 0),
                    leading: __designTimeInteger("#2453.[5].[2].property.[0].[0].arg[0].value.[0].[0].[0].modifier[1].arg[0].value.arg[1].value", fallback: 0),
                    bottom: __designTimeInteger("#2453.[5].[2].property.[0].[0].arg[0].value.[0].[0].[0].modifier[1].arg[0].value.arg[2].value", fallback: 8),
                    trailing: __designTimeInteger("#2453.[5].[2].property.[0].[0].arg[0].value.[0].[0].[0].modifier[1].arg[0].value.arg[3].value", fallback: 0))
                    )
            } else {
                List {
                    ForEach(filteredEvents, id: \.id) { match in
                        MatchCard(
                            teamA: match.teamA,
                            teamB: match.teamB,
                            dateString: formatDate(match.dateTimeStart)
                        )
                    }
                    .listRowInsets(.init(
                        top: __designTimeInteger("#2453.[5].[2].property.[0].[0].arg[0].value.[0].[1].[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value", fallback: 0),
                        leading: __designTimeInteger("#2453.[5].[2].property.[0].[0].arg[0].value.[0].[1].[0].arg[0].value.[0].modifier[0].arg[0].value.arg[1].value", fallback: 0),
                        bottom: __designTimeInteger("#2453.[5].[2].property.[0].[0].arg[0].value.[0].[1].[0].arg[0].value.[0].modifier[0].arg[0].value.arg[2].value", fallback: 8),
                        trailing: __designTimeInteger("#2453.[5].[2].property.[0].[0].arg[0].value.[0].[1].[0].arg[0].value.[0].modifier[0].arg[0].value.arg[3].value", fallback: 0))
                    )
                }
            }
        }
    
#sourceLocation()
    }
}

extension HeaderView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 73)
        VStack(alignment: .center) {
            HStack {
                Image(__designTimeString("#2453.[4].[4].property.[0].[0].arg[1].value.[0].arg[0].value.[0].arg[0].value", fallback: "frisa-logox4"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: __designTimeInteger("#2453.[4].[4].property.[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[2].arg[0].value", fallback: 30))
                Spacer()
                
                Image(systemName: __designTimeString("#2453.[4].[4].property.[0].[0].arg[1].value.[0].arg[0].value.[2].arg[0].value", fallback: "bell"))
                    .font(.title)
                    .foregroundColor(.blue)
            }
            .padding(.horizontal)
    
            MatchCalendar(selectedDate: $selectedDate, events: events).padding()
            
            // Replace MatchCard with DetailTeamCard
            DetailTeamCard(
                data: DetailTeamData(
                    name: __designTimeString("#2453.[4].[4].property.[0].[0].arg[1].value.[2].arg[0].value.arg[0].value", fallback: "Independiente Santa Fé"), // Replace with actual team name
                    logoImgUrl: __designTimeString("#2453.[4].[4].property.[0].[0].arg[1].value.[2].arg[0].value.arg[1].value", fallback: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Escudo_de_Independiente_Santa_Fe.png/150px-Escudo_de_Independiente_Santa_Fe.png"), // Replace with actual logo URL
                    victories: __designTimeInteger("#2453.[4].[4].property.[0].[0].arg[1].value.[2].arg[0].value.arg[2].value", fallback: 10), // Replace with actual data
                    ties: __designTimeInteger("#2453.[4].[4].property.[0].[0].arg[1].value.[2].arg[0].value.arg[3].value", fallback: 5), // Replace with actual data
                    defeats: __designTimeInteger("#2453.[4].[4].property.[0].[0].arg[1].value.[2].arg[0].value.arg[4].value", fallback: 3), // Replace with actual data
                    points: __designTimeInteger("#2453.[4].[4].property.[0].[0].arg[1].value.[2].arg[0].value.arg[5].value", fallback: 25) // Replace with actual data
                )
            )
            .padding(.horizontal)
        }
        .padding(.bottom)
    
#sourceLocation()
    }
}

extension HomeView {
    @_dynamicReplacement(for: fetchMatchEvents()) private func __preview__fetchMatchEvents() {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 41)
        // Check if JWT token exists in UserDefaults
        guard let jwt = UserDefaults.standard.string(forKey: authService.jwtTokenKey) else {
            print("JWT token not available")
            return
        }
        
        guard let tournamentIdKey = UserDefaults.standard.string(forKey: authService.tournamentIdKey) else {
            print("Tournament not available")
            return
        }

        apiService.fetchMatchEvents(tournamentId: tournamentIdKey, token: jwt) { result in
            switch result {
            case .success(let events):
                print(__designTimeString("#2453.[3].[6].[2].modifier[0].arg[2].value.[0].[0].[0].arg[0].value", fallback: "SUCCESS"))
                DispatchQueue.main.async {
                    self.events = events
                }
            case .failure(let error):
                print(__designTimeString("#2453.[3].[6].[2].modifier[0].arg[2].value.[0].[1].[0].arg[0].value", fallback: "Failed to fetch match events:"), error.localizedDescription)
            }
        }
    
#sourceLocation()
    }
}

extension HomeView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 29)
        NavigationView {
            VStack {
                HeaderView(events: $events, authService: authService, apiService: apiService, selectedDate: $selectedDate)
                BodyView(events: events, selectedDate: selectedDate)
            }
        }
        .onAppear {
            fetchMatchEvents()
        }
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.HomeView
import struct ROLOSOFT_FRONT.HeaderView
import struct ROLOSOFT_FRONT.BodyView
import struct ROLOSOFT_FRONT.NavigationBarItemView
import struct ROLOSOFT_FRONT.HomeView_Previews

