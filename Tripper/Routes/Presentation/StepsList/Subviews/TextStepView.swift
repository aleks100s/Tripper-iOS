//
//  TextStepView.swift
//  iosApp
//
//  Created by Alexander on 24.08.2025.
//

import Speech
import SwiftUI

struct TextStepView: View {
    let textStep: TextStep

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Title(title: textStep.title)

            Text(textStep.text)
                .fontDesign(.monospaced)
            
            AudioPlayerButton(speech: [
                .init(text: textStep.title, pitch: 0.7),
                .init(text: textStep.text, pitch: 1.0)
            ])
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding(16)
    }
}
