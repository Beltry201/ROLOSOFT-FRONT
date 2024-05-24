@_private(sourceFile: "ProfileView.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI
import PDFKit

extension ProfileView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Profile/ProfileView.swift", line: 138)
        let authService = AuthService()
        
        // Creating a mock user for preview
        let mockUser = UserProfile(
            id: __designTimeString("#5023.[3].[0].property.[0].[1].value.arg[0].value", fallback: "c1c9ba5e-a10b-4e73-9b6c-084a73faef80"),
            firstName: __designTimeString("#5023.[3].[0].property.[0].[1].value.arg[1].value", fallback: "Admin"),
            lastName: __designTimeString("#5023.[3].[0].property.[0].[1].value.arg[2].value", fallback: "User"),
            email: __designTimeString("#5023.[3].[0].property.[0].[1].value.arg[3].value", fallback: "admin@hotmail.com"),
            phone: __designTimeString("#5023.[3].[0].property.[0].[1].value.arg[4].value", fallback: "0000000000"),
            birthDate: __designTimeString("#5023.[3].[0].property.[0].[1].value.arg[5].value", fallback: "2024-05-21"),
            gender: __designTimeString("#5023.[3].[0].property.[0].[1].value.arg[6].value", fallback: "MALE"),
            role: __designTimeString("#5023.[3].[0].property.[0].[1].value.arg[7].value", fallback: "admin"),
            CURP: __designTimeString("#5023.[3].[0].property.[0].[1].value.arg[8].value", fallback: "AAAAAAAAA"),
            address: UserProfile.Address(
                id: __designTimeString("#5023.[3].[0].property.[0].[1].value.arg[9].value.arg[0].value", fallback: "98497fc9-708d-468b-81b1-0558cb254c22"),
                address1: __designTimeString("#5023.[3].[0].property.[0].[1].value.arg[9].value.arg[1].value", fallback: "Calle 1"),
                address2: __designTimeString("#5023.[3].[0].property.[0].[1].value.arg[9].value.arg[2].value", fallback: "Calle 2"),
                city: __designTimeString("#5023.[3].[0].property.[0].[1].value.arg[9].value.arg[3].value", fallback: "Ciudad"),
                state: __designTimeString("#5023.[3].[0].property.[0].[1].value.arg[9].value.arg[4].value", fallback: "Estado"),
                postalCode: __designTimeString("#5023.[3].[0].property.[0].[1].value.arg[9].value.arg[5].value", fallback: "00000"),
                country: __designTimeString("#5023.[3].[0].property.[0].[1].value.arg[9].value.arg[6].value", fallback: "País")
            )
        )
        authService.userProfile = mockUser
        
        return ProfileView(authService: authService)
    
#sourceLocation()
    }
}

extension ProfileView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Profile/ProfileView.swift", line: 9)
        VStack {
            if let user = authService.userProfile {
                // Profile Header
                VStack {
                    Image(systemName: __designTimeString("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[0].arg[0].value.[0].arg[0].value", fallback: "person.circle.fill"))
                        .resizable()
                        .frame(width: __designTimeInteger("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[0].arg[0].value.[0].modifier[1].arg[0].value", fallback: 100), height: __designTimeInteger("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[0].arg[0].value.[0].modifier[1].arg[1].value", fallback: 100))
                        .foregroundColor(.red)
                        .padding(.top, __designTimeInteger("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[0].arg[0].value.[0].modifier[3].arg[1].value", fallback: 20))
                    
                    Text("\(user.firstName) \(user.lastName)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, __designTimeInteger("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[0].arg[0].value.[1].modifier[2].arg[1].value", fallback: 10))
                    
                    Text(user.role.capitalized)
                        .font(.title3)
                        .foregroundColor(.gray)
                        .padding(.bottom, __designTimeInteger("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[0].arg[0].value.[2].modifier[2].arg[1].value", fallback: 20))
                }
                
                // User Information
                VStack(alignment: .leading, spacing: __designTimeInteger("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[1].arg[1].value", fallback: 20)) {
                    HStack {
                        Image(systemName: __designTimeString("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[1].arg[2].value.[0].arg[0].value.[0].arg[0].value", fallback: "envelope.fill"))
                            .foregroundColor(.red)
                        Text(user.email)
                            .font(.body)
                    }
                    
                    HStack {
                        Image(systemName: __designTimeString("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[1].arg[2].value.[1].arg[0].value.[0].arg[0].value", fallback: "phone.fill"))
                            .foregroundColor(.red)
                        Text(user.phone)
                            .font(.body)
                    }
                    
                    HStack {
                        Image(systemName: __designTimeString("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[1].arg[2].value.[2].arg[0].value.[0].arg[0].value", fallback: "calendar"))
                            .foregroundColor(.red)
                        Text(user.birthDate)
                            .font(.body)
                    }
                    
                    HStack {
                        Image(systemName: __designTimeString("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[1].arg[2].value.[3].arg[0].value.[0].arg[0].value", fallback: "person.fill"))
                            .foregroundColor(.red)
                        Text(user.gender.capitalized)
                            .font(.body)
                    }
                    
                    HStack {
                        Image(systemName: __designTimeString("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[1].arg[2].value.[4].arg[0].value.[0].arg[0].value", fallback: "signature"))
                            .foregroundColor(.red)
                        Text("CURP: \(user.CURP)")
                            .font(.body)
                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: __designTimeString("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[1].arg[2].value.[5].arg[1].value.[0].arg[0].value.[0].arg[0].value", fallback: "house.fill"))
                                .foregroundColor(.red)
                            Text(__designTimeString("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[1].arg[2].value.[5].arg[1].value.[0].arg[0].value.[1].arg[0].value", fallback: "Address"))
                                .font(.headline)
                        }
                        Text("\(user.address.address1), \(user.address.address2)")
                            .font(.body)
                            .padding(.leading, __designTimeInteger("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[1].arg[2].value.[5].arg[1].value.[1].modifier[1].arg[1].value", fallback: 20))
                        Text("\(user.address.city), \(user.address.state) \(user.address.postalCode)")
                            .font(.body)
                            .padding(.leading, __designTimeInteger("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[1].arg[2].value.[5].arg[1].value.[2].modifier[1].arg[1].value", fallback: 20))
                        Text(user.address.country)
                            .font(.body)
                            .padding(.leading, __designTimeInteger("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[1].arg[2].value.[5].arg[1].value.[3].modifier[1].arg[1].value", fallback: 20))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.white)
                .cornerRadius(__designTimeInteger("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[1].modifier[3].arg[0].value", fallback: 15))
                .shadow(color: Color.black.opacity(__designTimeFloat("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[1].modifier[4].arg[0].value.modifier[0].arg[0].value", fallback: 0.1)), radius: __designTimeInteger("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[1].modifier[4].arg[1].value", fallback: 5), x: __designTimeInteger("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[1].modifier[4].arg[2].value", fallback: 0), y: __designTimeInteger("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[1].modifier[4].arg[3].value", fallback: 2))
                .padding(.horizontal, __designTimeInteger("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[1].modifier[5].arg[1].value", fallback: 20))
                .padding(.top, __designTimeInteger("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[1].modifier[6].arg[1].value", fallback: 10))
                
                // Button to see tournament rule book
                Button(action: {
                    isShowingPDF = __designTimeBoolean("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[2].arg[0].value.[0].[0]", fallback: true)
                }) {
                    HStack {
                        Image(systemName: __designTimeString("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[2].arg[1].value.[0].arg[0].value.[0].arg[0].value", fallback: "book"))
                            .foregroundColor(.white)
                        Text(__designTimeString("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[2].arg[1].value.[0].arg[0].value.[1].arg[0].value", fallback: "Ver reglamento"))
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                    }
                    .modifier(ButtonModifier())
                    .padding(.horizontal, __designTimeInteger("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[2].arg[1].value.[0].modifier[1].arg[1].value", fallback: 20))
                    .padding(.top, __designTimeInteger("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[2].arg[1].value.[0].modifier[2].arg[1].value", fallback: 10))
                    .shadow(color: Color.black.opacity(__designTimeFloat("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[2].arg[1].value.[0].modifier[3].arg[0].value.modifier[0].arg[0].value", fallback: 0.1)), radius: __designTimeInteger("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[2].arg[1].value.[0].modifier[3].arg[1].value", fallback: 5), x: __designTimeInteger("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[2].arg[1].value.[0].modifier[3].arg[2].value", fallback: 0), y: __designTimeInteger("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[2].arg[1].value.[0].modifier[3].arg[3].value", fallback: 2))
                }
                .sheet(isPresented: $isShowingPDF) {
                    if let url = Bundle.main.url(forResource: "reglamento_frisa", withExtension: "pdf") {
                        RuleBookView(url: url)
                    } else {
                        Text(__designTimeString("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[2].modifier[0].arg[1].value.[0].[1].[0].arg[0].value", fallback: "PDF not found"))
                    }
                }
                
                // Logout Button
                LogoutButton(authService: authService)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, __designTimeInteger("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[0].[3].modifier[1].arg[1].value", fallback: 20))
            } else {
                Text(__designTimeString("#5023.[2].[2].property.[0].[0].arg[0].value.[0].[1].[0].arg[0].value", fallback: "Loading profile..."))
                    .font(.title)
                    .padding()
            }
        }
        .onAppear {
            if authService.userProfile == nil {
                authService.checkAuthentication()
            }
        }
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.ProfileView
import struct ROLOSOFT_FRONT.ProfileView_Previews

