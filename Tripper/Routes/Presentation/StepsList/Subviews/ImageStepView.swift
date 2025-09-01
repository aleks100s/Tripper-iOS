//
//  ImageStepView.swift
//  iosApp
//
//  Created by Alexander on 24.08.2025.
//

import SwiftUI

struct ImageStepView: View {
    let imageStep: ImageStep
    
    private let id = UUID()
    @Environment(TTSService.self) private var ttsService

    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            Image(imageStep.image)
                .resizable()
                .scaledToFill()
            
            VStack(alignment: .leading, spacing: 16) {
                Title(title: imageStep.title)

                Text(imageStep.text)
                    .fontDesign(.monospaced)
                
                AudioPlayerButton(speech: [
                    .init(text: imageStep.title, pitch: 0.7),
                    .init(text: imageStep.text, pitch: 1.0)
                ])
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(16)
        }
    }
}
