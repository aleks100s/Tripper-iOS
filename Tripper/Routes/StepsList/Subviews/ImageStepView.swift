//
//  ImageStepView.swift
//  iosApp
//
//  Created by Alexander on 24.08.2025.
//

import SwiftUI

struct ImageStepView: View {
    let imageStep: ImageStep

    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            Image(imageStep.image)
                .resizable()
                .scaledToFill()
            
            VStack(alignment: .leading, spacing: 16) {
                Title(title: imageStep.title)

                Text(imageStep.text)
                    .fontDesign(.monospaced)
            }
            .padding(16)
        }
    }
}
