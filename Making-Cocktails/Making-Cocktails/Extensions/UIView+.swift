//
//  UIView+.swift
//  Making-Cocktails
//
//  Created by Quang Khanh on 14/12/2022.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
