//
//  TopOffersCollectionViewCell.swift
//  
//
//  Created by Abdul Rehman Amjad on 27/07/2023.
//

import UIKit
import LottieAnimationManager

public class TopOffersCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var lottieAnimationView: UIView!

    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    func setupUI() {
        lottieAnimationView.isHidden = true
    }
    
    public func configureCell(with bannerImage: String, animationURL: String?) {
        lottieAnimationView.subviews.forEach({ $0.removeFromSuperview() })

        if let animationJsonURL = animationURL, !animationJsonURL.isEmpty {
            lottieAnimationView.isHidden = false
            image.isHidden = true
            LottieAnimationManager.showAnimationFromUrl(FromUrl: animationJsonURL, animationBackgroundView: self.lottieAnimationView, removeFromSuper: false, loopMode: .loop) { (bool) in
                
            }
            
        } else {
            image.isHidden = false
            lottieAnimationView.isHidden = true
            if !bannerImage.isEmpty {
                self.image.setImageWithUrlString(bannerImage) { image in
                    if let image = image {
                        self.image.image = image
                    }
                }
            }
        }
        
        self.addMaskedCorner(withMaskedCorner: [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner], cornerRadius: 12.0)
    }

}
