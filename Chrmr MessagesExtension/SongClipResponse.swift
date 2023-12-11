//
//  SongClipResponse.swift
//  Chrmr MessagesExtension
//
//  Created by Luke Boggs on 1/10/21.
//  Copyright © 2021 Charms Co. All rights reserved.
//

import Foundation

struct SongClipResponse : Codable {
    
    let data: SongClipData
    
    init(data: SongClipData) {
        self.data = data
    }
}

struct SongClipData : Codable {
    
    let songclips: [SongClip]

    init(songclips: [SongClip]) {
        self.songclips = songclips
    }
}
