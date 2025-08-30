//
//  TextStepView.swift
//  iosApp
//
//  Created by Alexander on 24.08.2025.
//

import SwiftUI

struct TextStepView: View {
    let textStep: TextStep

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Title(title: textStep.title)

            Text(textStep.text)
                .fontDesign(.monospaced)
        }
        .padding(16)
    }
}
