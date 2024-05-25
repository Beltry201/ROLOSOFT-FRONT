import SwiftUI
import PDFKit

struct ProfileView: View {
    @ObservedObject var authService: AuthService
    @State private var isShowingPDF = false
    
    var body: some View {
        VStack {
            if let user = authService.userProfile {
                // Profile Header
                VStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.red)
                        .padding(.top, 20)
                    
                    Text("\(user.firstName) \(user.lastName)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 10)
                    
                    Text(user.role.capitalized)
                        .font(.title3)
                        .foregroundColor(.gray)
                        .padding(.bottom, 20)
                }
                
                // User Information
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.red)
                        Text(user.email)
                            .font(.body)
                    }
                    
                    HStack {
                        Image(systemName: "phone.fill")
                            .foregroundColor(.red)
                        Text(user.phone)
                            .font(.body)
                    }
                    
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundColor(.red)
                        Text(user.birthDate)
                            .font(.body)
                    }
                    
                    HStack {
                        Image(systemName: "person.fill")
                            .foregroundColor(.red)
                        Text(user.gender.capitalized)
                            .font(.body)
                    }
                    
                    HStack {
                        Image(systemName: "signature")
                            .foregroundColor(.red)
                        Text("CURP: \(user.CURP)")
                            .font(.body)
                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "house.fill")
                                .foregroundColor(.red)
                            Text("Address")
                                .font(.headline)
                        }
                        Text("\(user.address.address1), \(user.address.address2)")
                            .font(.body)
                            .padding(.leading, 20)
                        Text("\(user.address.city), \(user.address.state) \(user.address.postalCode)")
                            .font(.body)
                            .padding(.leading, 20)
                        Text(user.address.country)
                            .font(.body)
                            .padding(.leading, 20)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                .padding(.horizontal, 20)
                .padding(.top, 10)
                
                // Button to see tournament rule book
                Button(action: {
                    isShowingPDF = true
                }) {
                    HStack {
                        Image(systemName: "book")
                            .foregroundColor(.white)
                        Text("Ver reglamento")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                    }
                    .modifier(ButtonModifier())
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                }
                .sheet(isPresented: $isShowingPDF) {
                    if let url = Bundle.main.url(forResource: "reglamento_frisa", withExtension: "pdf") {
                        RuleBookView(url: url)
                    } else {
                        Text("PDF not found")
                    }
                }
                
                // Logout Button
                LogoutButton(authService: authService)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 20)
            } else {
                Text("Loading profile...")
                    .font(.title)
                    .padding()
            }
        }
        .onAppear {
            if authService.userProfile == nil {
                authService.checkAuthentication()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let authService = AuthService()
        
        // Creating a mock user for preview
        let mockUser = UserProfile(
            id: "c1c9ba5e-a10b-4e73-9b6c-084a73faef80",
            firstName: "Admin",
            lastName: "User",
            email: "admin@hotmail.com",
            phone: "0000000000",
            birthDate: "2024-05-21",
            gender: "MALE",
            role: "admin",
            CURP: "AAAAAAAAA",
            address: UserProfile.Address(
                id: "98497fc9-708d-468b-81b1-0558cb254c22",
                address1: "Calle 1",
                address2: "Calle 2",
                city: "Ciudad",
                state: "Estado",
                postalCode: "00000",
                country: "País"
            )
        )
        authService.userProfile = mockUser
        
        return ProfileView(authService: authService)
    }
}
