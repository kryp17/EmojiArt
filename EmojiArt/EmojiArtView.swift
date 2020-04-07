//
//  EmojiArtView.swift
//  EmojiArt
//
//  Created by krupakhar gandeepan on 06/04/20.
//  Copyright © 2020 krupakhar. All rights reserved.
//

import UIKit

class EmojiArtView: UIView {

    var backGroundImage: UIImage? { didSet{setNeedsDisplay(); setNeedsLayout()} }
    
    override func draw(_ rect: CGRect) {
        backGroundImage?.draw(in: bounds)
    }
    
    
    
    
    

}
