//
//  SongClip.swift
//  Chrmr MessagesExtension
//
//  Created by Luke Boggs on 1/10/21.
//  Copyright © 2021 Charms Co. All rights reserved.
//

import Foundation

struct SongClip : Codable {
    
    let id: String
    let title: String
    let artist: String
    let coverUrl: String
    let audioUrl: String
    
    init(id: String, title: String, artist: String, coverUrl: String, audioUrl: String) {
        self.id = id
        self.title = title
        self.artist = artist
        self.coverUrl = coverUrl
        self.audioUrl = audioUrl
    }
}
