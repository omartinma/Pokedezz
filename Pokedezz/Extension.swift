//
//  Extension.swift
//  ShortcutsCollectionView
//
//  Created by Hassan El Desouky on 12/13/18.
//  Copyright © 2018 Hassan El Desouky. All rights reserved.
//

import UIKit

extension UIView {
    func setGradientBackgroundColor(colorOne: UIColor, colorTwo: UIColor) {
        var gradientLayer = CAGradientLayer()
        if let sublayers = layer.sublayers {
            for sublayer in sublayers {
                if let gLayer = sublayer as? CAGradientLayer {
                    gradientLayer = gLayer
                    break
                }
            }
        }
        
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension PokemonTypeLabel {
    func setGradientBackgroundColorLabel(colorOne: UIColor, colorTwo: UIColor) {
        var gradientLayer = CAGradientLayer()
        if let sublayers = layer.sublayers {
            for sublayer in sublayers {
                if let gLayer = sublayer as? CAGradientLayer {
                    gradientLayer = gLayer
                    break
                }
            }
        }
        
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
