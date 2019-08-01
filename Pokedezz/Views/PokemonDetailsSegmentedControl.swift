//
//  PokemonDetailsSegmentedControl.swift
//  Pokedezz
//
//  Created by Oscar Martín on 01/08/2019.
//  Copyright © 2019 Oscar Martín. All rights reserved.
//

import UIKit

class PokemonDetailsSegmentedControl: UISegmentedControl {

    
//     Only override draw() if you perform custom drawing.
//     An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        tintColor = .clear
        backgroundColor = .clear
        setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "DINCondensed-Bold", size: 18),
            NSAttributedString.Key.foregroundColor: UIColor.lightGray
            ], for: .normal)
        
       
         super.draw(rect)
    }
 

}
