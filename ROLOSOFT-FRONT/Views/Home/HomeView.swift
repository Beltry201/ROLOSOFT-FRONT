//
//  HomeView.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 23/04/24.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var authService: AuthService
    @ObservedObject var apiService: APIService
    @State private var events: [MatchEvent] = []
    @State private var selectedDate: Date = Date()
    @State private var teamDetails: TeamDetails? = nil
    
    var body: some View {
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
    }
    
    private func fetchMatchEvents() {
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
                print("Failed to fetch match events:", error.localizedDescription)
            }
        }
    }
    
    private func fetchTeamDetails() {
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
                print("Failed to fetch team details:", error.localizedDescription)
            }
        }
    }
}

struct HeaderView: View {
    @Binding var events: [MatchEvent]
    @ObservedObject var authService: AuthService
    @ObservedObject var apiService: APIService
    @Binding var selectedDate: Date
    @Binding var teamDetails: TeamDetails?
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Image("frisa-logox4")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 30)
                Spacer()
                
                Image(systemName: "bell")
                    .font(.title)
                    .foregroundColor(.blue)
            }
            .padding(.horizontal)
    
            MatchCalendar(selectedDate: $selectedDate, events: events).padding()
            
            if let teamDetails = teamDetails {
                DetailTeamCard(data: teamDetails)
                    .padding(.horizontal)
            } else {
                Text("Loading team details...")
                    .padding(.horizontal)
            }
        }
        .padding(.bottom)
    }
}

struct BodyView: View {
    var events: [MatchEvent]
    var selectedDate: Date
    
    var body: some View {
        VStack {
            if filteredEvents.isEmpty {
                List {
                    Text("No hay partidos programados.")
                        .foregroundColor(.gray)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .listRowBackground(Color.white)
                .listRowInsets(.init(
                    top: 0,
                    leading: 0,
                    bottom: 8,
                    trailing: 0)
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
                        top: 0,
                        leading: 0,
                        bottom: 8,
                        trailing: 0)
                    )
                }
            }
        }
    }
    
    private var filteredEvents: [MatchEvent] {
        events.filter { event in
            Calendar.current.isDate(event.dateTimeStart, inSameDayAs: selectedDate)
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: date)
    }
}

struct NavigationBarItemView: View {
    var body: some View {
        HStack {
            NavigationLink(destination: Text("Profile")) {
                Image(systemName: "person")
            }
            .padding(.horizontal)
            
            NavigationLink(destination: Text("Settings")) {
                Image(systemName: "gear")
            }
            .padding(.horizontal)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let apiService = APIService() // Initialize APIService instance
        let authService = AuthService()
        return HomeView(authService: authService, apiService: apiService)
    }
}
