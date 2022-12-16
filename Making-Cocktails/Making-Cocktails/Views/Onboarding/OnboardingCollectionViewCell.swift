//
//  OnboardingCollectionViewCell.swift
//  Making-Cocktails
//
//  Created by Quang Khánh on 14/12/2022.
//

import UIKit

final class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet private weak var slideImageView: UIImageView!
    @IBOutlet private weak var slideTitleLbl: UILabel!
    @IBOutlet private weak var slideDescriptionLbl: UILabel!
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitleLbl.text = slide.title
        slideDescriptionLbl.text = slide.descrition
    }
}
