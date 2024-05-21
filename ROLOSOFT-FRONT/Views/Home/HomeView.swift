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
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView()
                BodyView()
            }
        }
    }
}

struct HeaderView: View {
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
    
            CalendarComponent().padding()
            
            // Dummy team data
            let teamA = ScoreCardTeamData(
                name: "IDS",
                logo: "https://upload.wikimedia.org/wikipedia/commons/5/58/Escudo_de_Independiente_Santa_Fe.png",
                score: 2
            )
            
            let teamB = ScoreCardTeamData(
                name: "AN",
                logo: "https://upload.wikimedia.org/wikipedia/commons/d/d7/Atlético_Nacional.png",
                score: 1
            )
            MatchCard(teamA: teamA, teamB: teamB, dateString: "4:00 PM", isMyMatch: true)
                .padding(.horizontal)
        }
        .padding(.bottom)
    }
}

struct BodyView: View {
    var body: some View {
        List {
            ForEach(matchCardsData, id: \.id) { match in
                MatchCard(
                    teamA: match.teamA,
                    teamB: match.teamB,
                    dateString: match.dateString
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
        let authService = AuthService()
        return HomeView(authService: authService)
    }
}
