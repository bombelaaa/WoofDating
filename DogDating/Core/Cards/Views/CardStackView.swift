//
//  CardStackView.swift
//  DogDating
//
//  Created by Jimy on 12/10/24.
//

import SwiftUI

struct CardStackView: View {
    @StateObject var viewModel = CardsViewModel(service: CardService())
    
    var body: some View {
        ZStack {
            ForEach(viewModel.cardModels) { card in
                CardView(viewModel: viewModel, model: card)
            }
        }
        }
    }


#Preview {
    CardStackView()
}
