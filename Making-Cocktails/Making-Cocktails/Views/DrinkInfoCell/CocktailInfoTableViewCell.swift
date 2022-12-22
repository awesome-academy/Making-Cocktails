//
//  CocktailInfoTableViewCell.swift
//  Sample-repository-code-sample
//
//  Created by Quang Khánh on 19/12/2022.
//

import UIKit

final class CocktailInfoTableViewCell: UITableViewCell {
    
    private let network = APICaller.shared
    
    @IBOutlet weak var buttonNextDetail: UIImageView!
    @IBOutlet private weak var cellUI: UIView!
    @IBOutlet private weak var labelCategoryDrink: UILabel!
    @IBOutlet private weak var labelNameDrink: UILabel!
    @IBOutlet private weak var imageDrink: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    private func configView() {
        imageDrink.layer.cornerRadius = imageDrink.frame.height / 4
        imageDrink.clipsToBounds = true
        cellUI.dropShadow(color: .black, offSet: .zero, radius: 3)
        selectionStyle = .none
    }
    
    func configuge(title: Drink) {
        if let imageDrinkURL = title.strDrinkThumb, let url = URL(string: imageDrinkURL) {
            self.imageDrink.loadFrom(from: url)
            self.labelNameDrink.text = title.strDrink
            self.labelCategoryDrink.text = title.strCategory
            } else { print("Error") }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


