//
//  PlayerManager.swift
//  MyMusicApp
//
//  Created by Edward on 24.06.2023.
//

import Foundation
import AVFoundation

final class PlayerManager {
    
    static let shared = PlayerManager()
    private init() { }
    
    var localPlayer: AVAudioPlayer?
    
    func playTrackSampleFromLocal(at fileURL: URL) {
            print("play")
            DispatchQueue.main.async {
                do {
                    self.localPlayer = try AVAudioPlayer(contentsOf: fileURL)
                    self.localPlayer?.prepareToPlay()
                    self.localPlayer?.play()
                } catch {
                    print("Error playing track sample: \(error.localizedDescription)")
                }
            }
        }
}
