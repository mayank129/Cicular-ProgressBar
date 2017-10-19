//
//  AverageStarRating.swift
//  Random
//
//  Created by Mayank on 17/10/17.
//  Copyright © 2017 Mayank. All rights reserved.
//

import UIKit
@IBDesignable
class AverageStarRating: UIView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    var emptyImageViews:[UIImageView] = []
    var fullImageViews:[UIImageView] = []
    var minImageSize : CGSize = CGSize(width:5.0 , height : 5.0)
    @IBInspectable var emptyImage : UIImage? {
        didSet{
            for image in emptyImageViews
            {
                image.image = emptyImage
            }
            refresh()
            
        }
    }
    @IBInspectable var fullImage : UIImage? {
        didSet{
            for image in fullImageViews
            {
                image.image = fullImage
            }
            refresh()
        }
    }
    @IBInspectable var rating:Double = 0{
        didSet{
            if rating !=  oldValue{
                refresh()
            }
            
        }
    }
    open var imageContentMode: UIViewContentMode = UIViewContentMode.scaleAspectFit
    @IBInspectable var maxRating : Int = 5{
        didSet{
            if maxRating != oldValue{
                removeImageViews()
                initImageViews()
                refresh()
                setNeedsLayout()
                
            }
        }
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initImageViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initImageViews()
    }
    func initImageViews(){
        
        guard emptyImageViews.isEmpty && fullImageViews.isEmpty else{
            return
        }
        for _ in 0..<maxRating{
            let empImage = UIImageView()
            empImage.contentMode = imageContentMode
            empImage.image = emptyImage
            emptyImageViews.append(empImage)
            addSubview(empImage)
            
            let fulImage = UIImageView()
            fulImage.contentMode = imageContentMode
            fulImage.image = fullImage
            fullImageViews.append(fulImage)
            addSubview(fulImage)
        }
    }
    func removeImageViews(){
        for i in 0..<emptyImageViews.count {
            var img = emptyImageViews[i]
            img.removeFromSuperview()
            img = fullImageViews[i]
            img.removeFromSuperview()
        }
        emptyImageViews.removeAll(keepingCapacity: false)
        fullImageViews.removeAll(keepingCapacity: false)
    }
    private func refresh() {
        for i in 0..<fullImageViews.count {
            let imageView = fullImageViews[i]
            
            if rating >= Double(i+1) {
                imageView.layer.mask = nil
                imageView.isHidden = false
            } else if rating > Double(i) && rating < Double(i+1) {
                let maskLayer = CALayer()
                maskLayer.frame = CGRect(x: 0, y: 0, width: CGFloat(rating-Double(i))*imageView.frame.size.width, height: imageView.frame.size.height)
                maskLayer.backgroundColor = UIColor.black.cgColor
                imageView.layer.mask = maskLayer
                imageView.isHidden = false
            } else {
                imageView.layer.mask = nil;
                imageView.isHidden = true
            }
        }
    }    
    // Calculates the ideal ImageView size in a given CGSize
    func sizeForImage(_ image: UIImage, inSize size: CGSize) -> CGSize {
        let imageRatio = image.size.width / image.size.height
        let viewRatio = size.width / size.height
        
        if imageRatio < viewRatio {
            let scale = size.height / image.size.height
            let width = scale * image.size.width
            
            return CGSize(width: width, height: size.height)
        } else {
            let scale = size.width / image.size.width
            let height = scale * image.size.height
            
            return CGSize(width: size.width, height: height)
        }
    }
    // Override to calculate ImageView frames
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        guard let emptyImage = emptyImage else {
            return
        }
        
        let desiredImageWidth = frame.size.width / CGFloat(emptyImageViews.count)
        let maxImageWidth = max(minImageSize.width, desiredImageWidth)
        let maxImageHeight = max(minImageSize.height, frame.size.height)
        let imageViewSize = sizeForImage(emptyImage, inSize: CGSize(width: maxImageWidth, height: maxImageHeight))
        let imageXOffset = (frame.size.width - (imageViewSize.width * CGFloat(emptyImageViews.count))) /
            CGFloat((emptyImageViews.count - 1))
        
        for i in 0..<maxRating {
            let imageFrame = CGRect(x: i == 0 ? 0 : CGFloat(i)*(imageXOffset+imageViewSize.width), y: 0, width: imageViewSize.width, height: imageViewSize.height)
            
            var imageView = emptyImageViews[i]
            imageView.frame = imageFrame
            
            imageView = fullImageViews[i]
            imageView.frame = imageFrame
        }
        
        refresh()
    }
    
    
}
