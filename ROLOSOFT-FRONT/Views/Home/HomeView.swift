//
//  HomeView.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 23/04/24.
//

import SwiftUI

// Create dummy team data
let teamA = ScoreCardTeamData(
    name: "IDS",
    logo: "https://upload.wikimedia.org/wikipedia/commons/5/58/Escudo_de_Independiente_Santa_Fe.png"
)

let teamB = ScoreCardTeamData(
    name: "AN",
    logo: "https://upload.wikimedia.org/wikipedia/commons/d/d7/Atlético_Nacional.png"
)

struct HomeView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var authService: AuthService
    @ObservedObject var apiService: APIService
    @State private var events: [MatchEvent] = []
    @State private var selectedDate: Date = Date()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(events: $events, authService: authService, apiService: apiService, selectedDate: $selectedDate)
                BodyView(events: events, selectedDate: selectedDate)
            }
        }
        .onAppear {
            fetchMatchEvents()
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
                print("SUCCESS")
                DispatchQueue.main.async {
                    self.events = events
                }
            case .failure(let error):
                print("Failed to fetch match events:", error.localizedDescription)
            }
        }
    }
}

struct HeaderView: View {
    @Binding var events: [MatchEvent]
    @ObservedObject var authService: AuthService
    @ObservedObject var apiService: APIService
    @Binding var selectedDate: Date
    
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
            
            // Replace MatchCard with DetailTeamCard
            DetailTeamCard(
                data: DetailTeamData(
                    name: "Independiente Santa Fé", // Replace with actual team name
                    logoImgUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Escudo_de_Independiente_Santa_Fe.png/150px-Escudo_de_Independiente_Santa_Fe.png", // Replace with actual logo URL
                    victories: 10, // Replace with actual data
                    ties: 5, // Replace with actual data
                    defeats: 3, // Replace with actual data
                    points: 25 // Replace with actual data
                )
            )
            .padding(.horizontal)
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
                    Text("No matches today")
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
                    .listRowBackground(Color.gray.opacity(0))
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



let matchCardsData = [
    (id: 1, teamA: teamA, teamB: teamB, dateString: "4:00 PM"),
    (id: 2, teamA: teamA, teamB: teamB, dateString: "4:00 PM"),
    (id: 3, teamA: teamA, teamB: teamB, dateString: "4:00 PM"),
    (id: 4, teamA: teamA, teamB: teamB, dateString: "4:00 PM")
]

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
