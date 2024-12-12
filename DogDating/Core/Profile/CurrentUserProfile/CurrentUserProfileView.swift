//
//  CurrentUserProfileView.swift
//  DogDating
//
//  Created by Gabriel Ramos on 12/12/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @State private var showEditProfile = false
    let user: User
    
    var body: some View {
        NavigationStack {
            List {
                // header view
                CurrentUserProfileHeaderView(user: user)
                    .onTapGesture { showEditProfile.toggle() }
                
                // account info
                Section("Account Information") {
                    HStack {
                        Text("Name")
                        
                        Spacer()
                        
                        Text(user.fullname)
                    }
                    
                    HStack {
                        Text ("Email")
                        
                        Spacer()
                        
                        Text("test@gmail.com")
                    }
                }
                
                
                // legal
                Section("Legal") {
                    Text("Terms of Service")
                    
                }
                // logout/delete
                Section {
                    Button("Logout") {
                        print("Debug: Logout here..")
                    }
                    .foregroundStyle(.red)
                }
                Section{
                    Button("Delete Account") {
                        print("Debug: Delete account here..")
                    }
                    .foregroundStyle(.red)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $showEditProfile) {
                EditProfileView(user: user)
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: MockData.users[2])
}
