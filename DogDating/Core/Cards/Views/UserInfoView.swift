//
//  UserInfoView.swift
//  DogDating
//
//  Created by Jimy on 10/10/24.
//

import SwiftUI

struct UserInfoView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Bubby")
                    .font(.title)
                    .fontWeight(.heavy)
                
                Text("12")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    print("DEBUG: Show profile here...")
                } label: {
                    Image(systemName: "arrow.up.circle")
                        .fontWeight(.bold)
                        .imageScale(.large)
                }
                
            }
            
            Text("Corgy | Mix")
                .font(.subheadline)
                .lineLimit(2)
        }
        .foregroundStyle(.white)
        .padding()
        .background(
            LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    UserInfoView()
}
