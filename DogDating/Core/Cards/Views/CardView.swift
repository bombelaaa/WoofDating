//
//  CardView.swift
//  DogDating
//
//  Created by Jimy on 10/10/24.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var matchManager: MatchManager
    @ObservedObject var viewModel: CardsViewModel
    
    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0
    @State private var currentImageIndex = 0
    @State private var showProfileModel = false
    
    let model: CardModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(model.user.photoURLs[currentImageIndex])
                    .resizable()
                    .scaledToFill()
                    .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                    .overlay{
                        ImageScrollingView(currentImageIndex: $currentImageIndex, imageCount: imageCount)
                    }
                    
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                IndicatorView(currentImageindex: currentImageIndex, imageCount: imageCount)
                
                SwipeActionIndicatorView(xOffset: $xOffset)
            }
                
            UserInfoView(showProfileModel: $showProfileModel, user: user)
                .padding(.horizontal)
        }
        .fullScreenCover(isPresented: $showProfileModel) {
            UserProfileView(user: user)
        }
        .onReceive(viewModel.$buttonSwipeAction, perform: { action in
            onReceiveSwipeAction(action)
        })
        .offset(x: xOffset)
        .rotationEffect(.degrees(degrees))
//        .animation(.snappy, value: xOffset)
        .gesture(
            DragGesture()
                .onChanged(onDragChanged)
                .onEnded(onDragEnded)
            )
    }
}

private extension CardView {
    var user: User {
        return model.user
    }
    var imageCount: Int {
        return model.user.photoURLs.count
    }
}

private extension CardView {
    func returnToCenter() {
        xOffset = 0
        degrees = 0
    }
    func swipeRight() {
        withAnimation {
            xOffset = 500
            degrees = 12
        } completion: {
            viewModel.removeCard(model)
            matchManager.checkForMatch(withUser: user)
        }
    }
        func swipeLeft() {
            withAnimation {
                xOffset = -500
                degrees = -12
            } completion: {
                viewModel.removeCard(model)
            }
        }
    
    func onReceiveSwipeAction(_ action: SwipeAction?) {
        guard let action else { return}
        
        let topCard = viewModel.cardModels.last
        
        if topCard == model {
            switch action{
            case .reject:
                swipeLeft()
            case .like:
                swipeRight()
            }
        }
    }
}


private extension CardView {
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value) {
        xOffset = value.translation.width
        degrees = Double(value.translation.width / 25)
    }
    
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
        
        if abs(width) <= abs(SizeConstants.screenCutoff) {
            returnToCenter()
        }
        if width >= SizeConstants.screenCutoff {
            swipeRight()
        } else {
            swipeLeft()
        }
    }
}

#Preview {
    CardView(viewModel: CardsViewModel(service: CardService()),
             model: CardModel(user: MockData.users[1]))
}
