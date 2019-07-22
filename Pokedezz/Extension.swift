//
//  Extension.swift
//  ShortcutsCollectionView
//
//  Created by Hassan El Desouky on 12/13/18.
//  Copyright © 2018 Hassan El Desouky. All rights reserved.
//

import UIKit

//public extension UIColor {
//
//    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
//        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
//    }
//
//    static var customBackgroundColor: UIColor = {
//        return UIColor(r: 239, g: 239, b: 244)
//    }()
//
//}

//extension UIColor {
//    convenience init(hexString: String, alpha: CGFloat = 1) {
//        assert(hexString[hexString.startIndex] == "#", "Expected hex string of format #RRGGBB")
//
//        let scanner = Scanner(string: hexString)
//        scanner.scanLocation = 1  // skip #
//
//        var rgb: UInt32 = 0
//        scanner.scanHexInt32(&rgb)
//
//        self.init(
//            red:   CGFloat((rgb & 0xFF0000) >> 16)/255.0,
//            green: CGFloat((rgb &   0xFF00) >>  8)/255.0,
//            blue:  CGFloat((rgb &     0xFF)      )/255.0,
//            alpha: alpha)
//    }
//}
//
//extension UIColor {
//    func toHexString() -> String {
//        var r:CGFloat = 0
//        var g:CGFloat = 0
//        var b:CGFloat = 0
//        var a:CGFloat = 0
//
//        getRed(&r, green: &g, blue: &b, alpha: &a)
//
//        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
//
//        return String(format:"#%06x", rgb)
//    }
//}

extension UIView {
    func setGradientBackgroundColor(colorOne: UIColor, colorTwo: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
