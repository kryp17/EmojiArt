//
//  EmojiArt.swift
//  EmojiArt
//
//  Created by krupakhar gandeepan on 08/04/20.
//  Copyright © 2020 krupakhar. All rights reserved.
//

import Foundation
struct EmojiArt: Codable {
    var url: URL
    var emojis = [EmojiInfo]()
    
    struct EmojiInfo: Codable {
        let x: Int
        let y: Int
        let text: String
        let size: Int
    }
    
    init(url: URL, emojis: [EmojiInfo]){
        self.url = url
        self.emojis = emojis
    }
}
