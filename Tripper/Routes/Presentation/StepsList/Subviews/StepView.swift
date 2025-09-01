//
//  StepView.swift
//  iosApp
//
//  Created by Alexander on 24.08.2025.
//

import SwiftUI

struct StepView: View {
    let step: Step

    var body: some View {
        VStack {
            switch step {
            case .text(let textStep):
                TextStepView(textStep: textStep)
            case .image(let imageStep):
                ImageStepView(imageStep: imageStep)
            case .transit(let transitStep):
                TransitStepView(transit: transitStep)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .scrollTransition(.animated.threshold(.visible(0.3))) { content, phase in
            content
                    .opacity(phase.isIdentity ? 1.0 : 0.8)
                    .scaleEffect(phase.isIdentity ? 1.0 : 0.9)
        }
        .transition(.move(edge: .trailing).animation(.easeOut).combined(with: .blurReplace))
        .hoverEffect(.lift)
    }
}
