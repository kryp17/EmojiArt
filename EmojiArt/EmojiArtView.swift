//
//  EmojiArtView.swift
//  EmojiArt
//
//  Created by krupakhar gandeepan on 06/04/20.
//  Copyright © 2020 krupakhar. All rights reserved.
//

import UIKit

class EmojiArtView: UIView, UIDropInteractionDelegate {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup(){
        addInteraction(UIDropInteraction(delegate: self))
    }
    
    

    var backGroundImage: UIImage? { didSet{setNeedsDisplay(); setNeedsLayout()} }
    
    override func draw(_ rect: CGRect) {
        backGroundImage?.draw(in: bounds)
    }
    
    
    
    
    

}
