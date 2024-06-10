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
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 212)
        let apiService = APIService() // Initialize APIService instance
        let authService = AuthService()
        return HomeView(authService: authService, apiService: apiService)
    
#sourceLocation()
    }
}

extension NavigationBarItemView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 196)
        HStack {
            NavigationLink(destination: Text(__designTimeString("#6756.[4].[0].property.[0].[0].arg[0].value.[0].arg[0].value.arg[0].value", fallback: "Profile"))) {
                Image(systemName: __designTimeString("#6756.[4].[0].property.[0].[0].arg[0].value.[0].arg[1].value.[0].arg[0].value", fallback: "person"))
            }
            .padding(.horizontal)
            
            NavigationLink(destination: Text(__designTimeString("#6756.[4].[0].property.[0].[0].arg[0].value.[1].arg[0].value.arg[0].value", fallback: "Settings"))) {
                Image(systemName: __designTimeString("#6756.[4].[0].property.[0].[0].arg[0].value.[1].arg[1].value.[0].arg[0].value", fallback: "gear"))
            }
            .padding(.horizontal)
        }
    
#sourceLocation()
    }
}

extension BodyView {
    @_dynamicReplacement(for: formatDate(_:)) private func __preview__formatDate(_ date: Date) -> String {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 188)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = __designTimeString("#6756.[3].[4].[1].[0]", fallback: "h:mm a")
        return dateFormatter.string(from: date)
    
#sourceLocation()
    }
}

extension BodyView {
    @_dynamicReplacement(for: filteredEvents) private var __preview__filteredEvents: [MatchEvent] {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 182)
        events.filter { event in
            Calendar.current.isDate(event.dateTimeStart, inSameDayAs: selectedDate)
        }
    
#sourceLocation()
    }
}

extension BodyView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 146)
        VStack {
            if filteredEvents.isEmpty {
                List {
                    Text(__designTimeString("#6756.[3].[2].property.[0].[0].arg[0].value.[0].[0].[0].arg[0].value.[0].arg[0].value", fallback: "No hay partidos programados."))
                        .foregroundColor(.gray)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .listRowBackground(Color.white)
                .listRowInsets(.init(
                    top: __designTimeInteger("#6756.[3].[2].property.[0].[0].arg[0].value.[0].[0].[0].modifier[1].arg[0].value.arg[0].value", fallback: 0),
                    leading: __designTimeInteger("#6756.[3].[2].property.[0].[0].arg[0].value.[0].[0].[0].modifier[1].arg[0].value.arg[1].value", fallback: 0),
                    bottom: __designTimeInteger("#6756.[3].[2].property.[0].[0].arg[0].value.[0].[0].[0].modifier[1].arg[0].value.arg[2].value", fallback: 8),
                    trailing: __designTimeInteger("#6756.[3].[2].property.[0].[0].arg[0].value.[0].[0].[0].modifier[1].arg[0].value.arg[3].value", fallback: 0))
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
                        top: __designTimeInteger("#6756.[3].[2].property.[0].[0].arg[0].value.[0].[1].[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value", fallback: 0),
                        leading: __designTimeInteger("#6756.[3].[2].property.[0].[0].arg[0].value.[0].[1].[0].arg[0].value.[0].modifier[0].arg[0].value.arg[1].value", fallback: 0),
                        bottom: __designTimeInteger("#6756.[3].[2].property.[0].[0].arg[0].value.[0].[1].[0].arg[0].value.[0].modifier[0].arg[0].value.arg[2].value", fallback: 8),
                        trailing: __designTimeInteger("#6756.[3].[2].property.[0].[0].arg[0].value.[0].[1].[0].arg[0].value.[0].modifier[0].arg[0].value.arg[3].value", fallback: 0))
                    )
                }
            }
        }
    
#sourceLocation()
    }
}

extension HeaderView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 113)
        VStack(alignment: .center) {
            HStack {
                Image(__designTimeString("#6756.[2].[5].property.[0].[0].arg[1].value.[0].arg[0].value.[0].arg[0].value", fallback: "frisa-logox4"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: __designTimeInteger("#6756.[2].[5].property.[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[2].arg[0].value", fallback: 30))
                Spacer()
                
                Image(systemName: __designTimeString("#6756.[2].[5].property.[0].[0].arg[1].value.[0].arg[0].value.[2].arg[0].value", fallback: "bell"))
                    .font(.title)
                    .foregroundColor(.blue)
            }
            .padding(.horizontal)
    
            MatchCalendar(selectedDate: $selectedDate, events: events).padding()
            
            if let teamDetails = teamDetails {
                DetailTeamCard(data: teamDetails)
                    .padding(.horizontal)
            } else {
                Text(__designTimeString("#6756.[2].[5].property.[0].[0].arg[1].value.[2].[1].[0].arg[0].value", fallback: "Loading team details..."))
                    .padding(.horizontal)
            }
        }
        .padding(.bottom)
    
#sourceLocation()
    }
}

extension HomeView {
    @_dynamicReplacement(for: fetchTeamDetails()) private func __preview__fetchTeamDetails() {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 63)
        guard let jwt = UserDefaults.standard.string(forKey: authService.jwtTokenKey) else {
            print("JWT token not available")
            return
        }
        
        guard let tournamentIdKey = UserDefaults.standard.string(forKey: authService.tournamentIdKey) else {
            print("Tournament not available")
            return
        }
        
        guard let teamId = UserDefaults.standard.string(forKey: "teamId") else {
            print("Team ID not available")
            return
        }

        apiService.fetchTeamDetails(tournamentId: tournamentIdKey, teamId: teamId, token: jwt) { result in
            switch result {
            case .success(let details):
                DispatchQueue.main.async {
                    self.teamDetails = TeamDetails(
                        tournamentId: details.tournamentId, 
                        schoolId: details.schoolId,
                        schoolName: details.schoolName,
                        defeats: details.defeats,
                        draws: details.draws,
                        victories: details.victories,
                        goalsFor: details.goalsFor,
                        goalsAgainst: details.goalsAgainst,
                        goalDifference: details.goalDifference,
                        gamesPlayed: details.gamesPlayed,
                        points: details.points,
                        position: details.position,
                        shieldFileName: details.shieldFileName
                    )
                }
            case .failure(let error):
                print(__designTimeString("#6756.[1].[8].[3].modifier[0].arg[3].value.[0].[1].[0].arg[0].value", fallback: "Failed to fetch team details:"), error.localizedDescription)
            }
        }
    
#sourceLocation()
    }
}

extension HomeView {
    @_dynamicReplacement(for: fetchMatchEvents()) private func __preview__fetchMatchEvents() {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 38)
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
                print("SUCCESS: \(events)")
                DispatchQueue.main.async {
                    self.events = events
                }
            case .failure(let error):
                print(__designTimeString("#6756.[1].[7].[2].modifier[0].arg[2].value.[0].[1].[0].arg[0].value", fallback: "Failed to fetch match events:"), error.localizedDescription)
            }
        }
    
#sourceLocation()
    }
}

extension HomeView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Home/HomeView.swift", line: 19)
        NavigationView {
            VStack {
                HeaderView(
                    events: $events,
                    authService: authService,
                    apiService: apiService,
                    selectedDate: $selectedDate,
                    teamDetails: $teamDetails
                )
                BodyView(events: events, selectedDate: selectedDate)
            }
        }
        .onAppear {
            fetchMatchEvents()
            fetchTeamDetails()
        }
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.HomeView
import struct ROLOSOFT_FRONT.HeaderView
import struct ROLOSOFT_FRONT.BodyView
import struct ROLOSOFT_FRONT.NavigationBarItemView
import struct ROLOSOFT_FRONT.HomeView_Previews

