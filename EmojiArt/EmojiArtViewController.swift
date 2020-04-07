//
//  EmojiArtViewController.swift
//  EmojiArt
//
//  Created by krupakhar gandeepan on 06/04/20.
//  Copyright © 2020 krupakhar. All rights reserved.
//

import UIKit

class EmojiArtViewController: UIViewController,UIDropInteractionDelegate, UIScrollViewDelegate {


    @IBOutlet weak var dropZone: UIView!{
        didSet{
            dropZone.addInteraction(UIDropInteraction(delegate: self))
        }
    }

    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.minimumZoomScale = 0.1
            scrollView.maximumZoomScale = 5.0
            scrollView.delegate = self
            scrollView.addSubview(emojiArtView)
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return emojiArtView
    }
    
    var emojiBackgroundImage: UIImage?{
        get{
            return emojiArtView.backGroundImage
        }
        set{
            scrollView?.zoomScale = 1.0
            emojiArtView.backGroundImage = newValue
            let size = newValue?.size ?? CGSize.zero
            emojiArtView.frame = CGRect(origin: CGPoint.zero, size: size)
            scrollView?.contentSize = size
            if let dropZone = self.dropZone, size.width > 0, size.height>0{
                scrollView?.zoomScale = max(dropZone.bounds.size.width/size.width , dropZone.bounds.size.height/size.height)
            }
        }
    }
    
    var emojiArtView = EmojiArtView()
    
    
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: NSURL.self) && session.canLoadObjects(ofClass: UIImage.self)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }
    
    var imageFetcher: ImageFetcher!
    
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        Spinner.startAnimating()
            imageFetcher = ImageFetcher() { (url, image) in
            DispatchQueue.main.async{
                self.emojiBackgroundImage = image
            }
        }
        
        session.loadObjects(ofClass: NSURL.self){ nsurls in
            if let url = nsurls.first as? URL{
            self.imageFetcher.fetch(url)
            }
        }
        session.loadObjects(ofClass: UIImage.self){ images in
            if let image = images.first as? UIImage{
            self.imageFetcher.backup = image
            }
        }
            Spinner.stopAnimating()
    }
    
    @IBOutlet weak var Spinner: UIActivityIndicatorView!
    
    

    
}
