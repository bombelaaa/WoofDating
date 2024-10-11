//
//  CardView.swift
//  DogDating
//
//  Created by Jimy on 10/10/24.
//

import SwiftUI

struct CardView: View {
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(.image)
                .resizable()
                .scaledToFill()
                .frame(width: cardWidth, height: cardHeight)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            UserInfoView()
                .padding(.horizontal)
        }
    }
}

extension CardView {
    var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }
    
    
    var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }
    
}
#Preview {
    CardView()
}
