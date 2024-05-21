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
                // Logo view
                Image("frisa-logox4")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 30)
                Spacer()
                // Notifications icon view
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
            
            // Use the ScoreCard with dummy data
            ScoreCard(teamA: teamA, teamB: teamB)
                .padding(.horizontal)
        }
        .padding(.bottom)
    }
}


struct BodyView: View {
    var body: some View {
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
    }
}

let newsData = [
    (title: "Title 1", date: "Date 1", desc: "Description 1", imgUrl: "https://www.pikpng.com/pngl/m/430-4309067_escudo-del-club-independiente-santa-fe-cardenales-primer.png"),
    (title: "Title 2", date: "Date 2", desc: "Description 2", imgUrl: "https://www.pikpng.com/pngl/m/430-4309067_escudo-del-club-independiente-santa-fe-cardenales-primer.png"),
    (title: "Title 3", date: "Date 3", desc: "Description 3", imgUrl: "https://www.pikpng.com/pngl/m/430-4309067_escudo-del-club-independiente-santa-fe-cardenales-primer.png"),
    (title: "Title 4", date: "Date 4", desc: "Description 4", imgUrl: "https://www.pikpng.com/pngl/m/430-4309067_escudo-del-club-independiente-santa-fe-cardenales-primer.png"),
    (title: "Title 5", date: "Date 5", desc: "Description 5", imgUrl: "https://www.pikpng.com/pngl/m/430-4309067_escudo-del-club-independiente-santa-fe-cardenales-primer.png")
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
