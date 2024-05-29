//
//  LeaderBoardView.swift
//  ROLOSOFT-FRONT
//
//  Created by Juan Camilo Bedoya Barbosa on 27/05/24.
//

import SwiftUI

struct LeaderBoardTeam: Identifiable {
    let id = UUID()
    let name: String
    let logo: String
    let d: Int
    let e: Int
    let v: Int
    let isMyTeam: Bool
}

struct LeaderBoardView: View {
    @State private var teams: [LeaderBoardTeam] = []
    @StateObject var apiService = APIService()
    
    struct ListItemBg: ViewModifier {
        var isMyTeam: Bool? = false
        
        func body(content: Content) -> some View {
            if let isMyTeam = isMyTeam, isMyTeam {
                return AnyView(content
                    .listRowBackground(LinearGradient(gradient: Gradient(colors: [Color(red: 0.854, green: 0.000, blue: 0.176, opacity: 0.85), Color(red: 0.882, green: 0.341, blue: 0.008, opacity: 0.85)]), startPoint: .bottom, endPoint: .top))
                )
            } else {
                return AnyView(content
                    .listRowBackground(Color.white)
                )
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Equipo")
                    Spacer()
                    Text("D")
                    Spacer()
                    Text("E")
                    Spacer()
                    Text("V")
                }
                .padding()
                .font(.headline)
                
                List(teams.indices, id: \.self) { index in
                    HStack {
                        Text("\(index + 1)")
                            .font(.headline)
                            .foregroundColor(teams[index].isMyTeam ? .white : .black)
                        URLImage(url: teams[index].logo)
                            .frame(width: 30, height: 30)
                            .cornerRadius(8)
                            .clipped()
                        Text(teams[index].name)
                            .font(.headline)
                            .foregroundColor(teams[index].isMyTeam ? .white : .black)
                        Spacer()
                        Text("\(teams[index].d)")
                            .font(.subheadline)
                            .foregroundColor(teams[index].isMyTeam ? .white : .black)
                        Spacer()
                        Text("\(teams[index].e)")
                            .font(.subheadline)
                            .foregroundColor(teams[index].isMyTeam ? .white : .black)
                        Spacer()
                        Text("\(teams[index].v)")
                            .font(.subheadline)
                            .foregroundColor(teams[index].isMyTeam ? .white : .black)
                    }
                    .padding()
                    .modifier(ListItemBg(isMyTeam: teams[index].isMyTeam))
                    .cornerRadius(8)
                    .listRowInsets(EdgeInsets.init(top: 10, leading: 0, bottom: 10, trailing: 0))
                }
                .listStyle(.inset)
            }.onAppear{loadLeaderBoard()}
        }
    }
    
    private func loadLeaderBoard() {
        let tournamentId = UserDefaults.standard.string(forKey: "tournamentId") ?? ""
        let token = UserDefaults.standard.string(forKey: "jwtToken") ?? ""

        print("\n-- TID:", tournamentId)
        print("\n-- TOKEN:", token)
        
        apiService.fetchLeaderBoard(tournamentId: tournamentId, token: token) { result in
            switch result {
            case .success(let teamData):
                self.teams = teamData.map { team in
                    LeaderBoardTeam(
                        name: team.team,
                        logo: team.photoUrl,
                        d: team.defeats,
                        e: team.draws,
                        v: team.victories,
                        isMyTeam: false // Update based on your criteria
                    )
                }
            case .failure(let error):
                print("Error fetching leaderboard: \(error)")
            }
        }
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
    }
}
