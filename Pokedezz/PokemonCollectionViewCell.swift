//
//  PokemonCollectionViewCell.swift
//  Pokedezz
//
//  Created by Oscar Martín on 18/07/2019.
//  Copyright © 2019 Oscar Martín. All rights reserved.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .blue
        contentView.backgroundColor = .blue
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
