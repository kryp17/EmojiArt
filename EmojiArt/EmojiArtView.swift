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
    
        func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
            return session.canLoadObjects(ofClass: NSAttributedString.self)
        }
        
        func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
            return UIDropProposal(operation: .copy)
        }
        
        func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
            session.loadObjects(ofClass: NSAttributedString.self) {providers in
                let dropPoint = session.location(in: self)
                for attributedString in providers as? [NSAttributedString] ?? []{
                    self.addLabel(with:attributedString, centeredAt: dropPoint)
                }
            }
          }

    var backGroundImage: UIImage? { didSet{setNeedsDisplay(); setNeedsLayout()} }
    
    override func draw(_ rect: CGRect) {
        backGroundImage?.draw(in: bounds)
    }
    
    private func addLabel(with attributedString: NSAttributedString, centeredAt point: CGPoint){
        let label = UILabel()
        label.backgroundColor = .clear
        label.attributedText = attributedString
        label.sizeToFit()
        label.center = point
        addSubview(label)
    }

}
