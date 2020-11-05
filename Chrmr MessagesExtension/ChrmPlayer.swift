//
//  ChrmPlayer.swift
//  Chrmr MessagesExtension
//
//  Created by Luke Boggs on 10/12/20.
//  Copyright © 2020 Charms Co. All rights reserved.
//

import Foundation
import AVFoundation

class ChrmPlayer {
    
    var lastPlayer: AVAudioPlayer?
    
    func playFile(fileUrl: URL) {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            if (lastPlayer != nil && lastPlayer!.isPlaying) {
                lastPlayer?.stop()
            }
            
            let player = try AVAudioPlayer(contentsOf: fileUrl, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            player.play()
            lastPlayer = player
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
