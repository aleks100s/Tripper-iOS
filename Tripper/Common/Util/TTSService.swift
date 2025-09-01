//
//  TTSService.swift
//  Tripper
//
//  Created by Alexander on 01.09.2025.
//

import AVFoundation

@Observable
final class TTSService: NSObject {
    enum SpeakerState {
        case speaking(UUID)
        case paused(UUID)
        case stopped
    }
    
    private enum State {
        case empty
        case busy(queue: Queue)
    }
    
    struct Queue {
        let id: UUID
        var items: [Speech]
    }
    
    struct Speech {
        let text: String
        let pitch: Float
    }
    
    var speakerState = SpeakerState.stopped

    private let synthesizer = AVSpeechSynthesizer()
    
    private var state = State.empty
    private var isTerminating = false
    
    override init() {
        super.init()
        synthesizer.delegate = self
    }

    func speak(_ queue: Queue) {
        guard !queue.items.isEmpty else { return }
        
        if synthesizer.isSpeaking {
            synthesizer.stopSpeaking(at: .immediate)
            isTerminating = true
        }
        var queue = queue
        speak(speech: queue.items.removeFirst())
        print("New queue id \(queue.id)")
        state = .busy(queue: queue)
    }
    
    private func speak(speech: Speech) {
        let utterance = AVSpeechUtterance(string: speech.text)
        utterance.voice = AVSpeechSynthesisVoice(language: Locale.current.identifier)
        utterance.rate = AVSpeechUtteranceDefaultSpeechRate            // 0.0...1.0 (зависит от девайса)
        utterance.pitchMultiplier = speech.pitch // 0.5...2.0
        utterance.volume = 1.0         // 0.0...1.0
        synthesizer.speak(utterance)
    }

    func pause()  {
        _ = synthesizer.pauseSpeaking(at: .immediate)
    }
    func resume() {
        synthesizer.continueSpeaking()
    }
    func stop() {
        synthesizer.stopSpeaking(at: .immediate)
        state = .empty
    }
}

extension TTSService: AVSpeechSynthesizerDelegate {
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        switch state {
        case .busy(queue: let queue):
            guard !isTerminating else {
                isTerminating = false
                speakerState = .stopped
                return
            }

            if queue.items.isEmpty {
                speakerState = .stopped
                state = .empty
            } else {
                var queue = queue
                speak(speech: queue.items.removeLast())
                print("Next item in the queue \(queue.id)")
                state = .busy(queue: queue)
            }
        case .empty:
            break
        }
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didPause utterance: AVSpeechUtterance) {
        switch state {
        case .busy(queue: let queue):
            speakerState = .paused(queue.id)
        case .empty:
            break
        }
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        switch state {
        case .busy(queue: let queue):
            print("Start speaking item in the queue \(queue.id)")
            speakerState = .speaking(queue.id)
        case .empty:
            break
        }
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
        speakerState = .stopped
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didContinue utterance: AVSpeechUtterance) {
        switch state {
        case .busy(queue: let queue):
            speakerState = .speaking(queue.id)
        case .empty:
            break
        }
    }
}
