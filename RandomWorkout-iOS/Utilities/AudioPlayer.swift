//
//  AudioPlayer.swift
//  RandomWorkout-iOS
//
//  Created by Duilan on 03/06/21.
//

import AVFoundation

final class AudioPlayer {
    var player: AVAudioPlayer!
    
    func playSound(fileName: String, withExtension: String = "wav") {
        
        guard let audioURL = Bundle.main.url(forResource: fileName, withExtension: withExtension) else {
            print("The \(fileName).\(withExtension) audio does not exist")
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: audioURL)
        } catch {
            print(error)
        }
        player.play()
    }
    
}
