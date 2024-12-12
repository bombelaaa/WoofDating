//
//  IndicatorView.swift
//  DogDating
//
//  Created by Jimy on 12/8/24.
//

import SwiftUI

struct IndicatorView: View {
    let currentImageindex: Int
    let imageCount: Int
    var body: some View {
        HStack{
            ForEach(0 ..< imageCount, id: \.self) {index in
                Capsule()
                    .foregroundStyle(currentImageindex ==  index ? .red : .gray)
                    .frame(width: imageIdicatorwidth, height: 4)
                    .padding(.top, 8)
            }
        }
    }
}

private extension IndicatorView {
    var imageIdicatorwidth: CGFloat {
        return SizeConstants.cardWidth / CGFloat(imageCount) - 28
    }
}

#Preview {
    IndicatorView(currentImageindex: 1, imageCount: 5)
        .preferredColorScheme(.dark)
}
