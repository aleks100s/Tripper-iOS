//
//  AudioPlayerButton.swift
//  Tripper
//
//  Created by Alexander on 01.09.2025.
//

import SwiftUI

struct AudioPlayerButton: View {
    let speech: [TTSService.Speech]

    @State private var id = UUID()
    @Environment(TTSService.self) private var ttsService
    
    var body: some View {
        Button {
            switch ttsService.speakerState {
            case .stopped:
                ttsService.speak(.init(id: id, items: speech))
            case .paused(let id):
                if id == self.id {
                    ttsService.resume()
                } else {
                    ttsService.speak(.init(id: self.id, items: speech))
                }
            case .speaking(let id):
                if id == self.id {
                    ttsService.pause()
                } else {
                    ttsService.speak(.init(id: self.id, items: speech))
                }
            }
        } label: {
            switch ttsService.speakerState {
            case .stopped:
               defaultButtonLabel
            case .speaking(let id):
                if id == self.id {
                    Label("Остановить", systemImage: "pause.fill")
                } else {
                    defaultButtonLabel
                }
            case .paused(let id):
                if id == self.id {
                    Label("Продлолжить", systemImage: "play.fill")
                } else {
                    defaultButtonLabel
                }
            }
            
        }
    }
    
    private var defaultButtonLabel: some View {
        Label("Прослушать", systemImage: "play.fill")
    }
}
