//
//  HomeView.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 23/04/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                HeaderView()
                Divider()
                BodyView()
            }
            .navigationTitle("Home")
            .navigationBarItems(trailing: NavigationBarItemView())
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("This Week's Events")
                .font(.headline)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(0..<7) { day in
                        DayCard(day: day)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct DayCard: View {
    let day: Int // Index of the day in the week
    
    var body: some View {
        VStack {
            Text("Day \(day + 1)")
                .font(.headline)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

struct BodyView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Latest Articles")
                .font(.headline)
                .padding(.horizontal)
            
            List {
                ForEach(1..<6) { index in
                    ArticleRow(title: "Article \(index)")
                }
            }
        }
    }
}

struct ArticleRow: View {
    let title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title3)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
        }
        .padding(.vertical, 5)
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
        .foregroundColor(.blue)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
