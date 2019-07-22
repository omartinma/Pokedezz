//
//  PokemonCollectionViewCell.swift
//  Pokedezz
//
//  Created by Oscar Martín on 18/07/2019.
//  Copyright © 2019 Oscar Martín. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class PokemonCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    
    var colorsTable : [Int: [UIColor]]  = [0: [#colorLiteral(red: 0.9654200673, green: 0.1590853035, blue: 0.2688751221, alpha: 1),#colorLiteral(red: 0.7559037805, green: 0.1139892414, blue: 0.1577021778, alpha: 1)], 1:[#colorLiteral(red: 0.3796315193, green: 0.7958304286, blue: 0.2592983842, alpha: 1),#colorLiteral(red: 0.2060100436, green: 0.6006633639, blue: 0.09944178909, alpha: 1)], 2:[#colorLiteral(red: 0.1774400771, green: 0.466574192, blue: 0.8732826114, alpha: 1),#colorLiteral(red: 0.00491155684, green: 0.287129879, blue: 0.7411141396, alpha: 1)],3:[#colorLiteral(red: 0.9495453238, green: 0.4185881019, blue: 0.6859942079, alpha: 1),#colorLiteral(red: 0.8123683333, green: 0.1657164991, blue: 0.5003474355, alpha: 1)]]
    var colorsTable1 : [Int: UIColor]  = [0: #colorLiteral(red: 0.9654200673, green: 0.1590853035, blue: 0.2688751221, alpha: 1), 1:#colorLiteral(red: 0.2060100436, green: 0.6006633639, blue: 0.09944178909, alpha: 1), 2:#colorLiteral(red: 0.00491155684, green: 0.287129879, blue: 0.7411141396, alpha: 1), 3:#colorLiteral(red: 0.8123683333, green: 0.1657164991, blue: 0.5003474355, alpha: 1)]
    
    
    override func layoutSubviews() {
        setupCell()
        super.layoutSubviews()
        
    }
    
    
    // MARK: Setup Cell
    fileprivate func setupCell() {
        roundCorner()
        setCellShadow()
    }
    
    // MARK: Methods
    func setUpContent(pokemon:Pokemon?){
        //Pokemon name
        pokemonNameLabel.text = pokemon?.name.uppercased()
        
        //Pokemon image
        pokemonImage.sd_setImage(with: URL(string: pokemon!.imageUrl))
        
      //  Pokemon Color with gradient not working
        let colors = chooseColorsByPokemonType(types: pokemon!.types)
        self.contentView.setGradientBackgroundColor(colorOne: colors[0], colorTwo: colors[1])

        //Pokemon color without gradient working
//        let color = chooseColorByPokemonType(types: pokemon!.types)
//        self.backgroundColor = color
    }
    
    func chooseColorsByPokemonType(types:[String]) -> [UIColor] {

        for type in types{
            print(type)
            switch type{
            case "grass" :
                return colorsTable[1]!
            case "fire" :
                return colorsTable[0]!
            case "water" :
                return colorsTable[2]!
            default:
                continue
            }
        }
        return colorsTable[3]!
    }
    
    func chooseColorByPokemonType(types:[String]) -> UIColor {
        
        for type in types{
            print(type)
            switch type{
            case "grass" :
                return colorsTable1[1]!
            case "fire" :
                return colorsTable1[0]!
            case "water" :
                return colorsTable1[2]!
            default:
                continue
            }
        }
        return colorsTable1[3]!
    }
    
    
    func setCellShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 10.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 10
        self.clipsToBounds = false
    }
    
    func roundCorner() {
        self.contentView.layer.cornerRadius = 12.0
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
    }
    
}
