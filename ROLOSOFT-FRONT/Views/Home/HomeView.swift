//
//  HomeView.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 23/04/24.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var authService: AuthService // Add authService as an observed object
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView()
                BodyView()
                LogoutButton(authService: authService) // Pass authService to LogoutButton
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
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
                    .foregroundColor(.blue) // Customize color as needed
            }
            .padding(.horizontal)
            
            CalendarComponent().padding()
        }
    }
}

struct BodyView: View {
    var body: some View {
        VStack(alignment: .leading) {
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

struct LogoutButton: View {
    @ObservedObject var authService: AuthService // Add authService as an observed object
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        Button(action: {
            authService.logOut() // Call logOut method from AuthService
            presentationMode.wrappedValue.dismiss() // Dismiss the current view
        }) {
            Text("Logout")
                .foregroundColor(.red)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let authService = AuthService() // Create an instance of AuthService
        return HomeView(authService: authService) // Pass authService to HomeView
    }
}
