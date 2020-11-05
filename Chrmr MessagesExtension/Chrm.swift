//
//  Chrm.swift
//  Chrmr MessagesExtension
//
//  Created by Luke Boggs on 9/2/19.
//  Copyright © 2019 Charms Co. All rights reserved.
//

import Foundation

struct Chrm: Codable {
    
    let title: String
    let artist: String
    let keywords: [String]
    let filename: String
    
    init(title: String, artist: String, keywords: [String], filename: String) {
        self.title = title
        self.artist = artist
        self.keywords = keywords
        self.filename = filename
    }
}
