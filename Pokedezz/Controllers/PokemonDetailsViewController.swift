//
//  PokemonDetailsViewController.swift
//  Pokedezz
//
//  Created by Oscar Martín on 23/07/2019.
//  Copyright © 2019 Oscar Martín. All rights reserved.
//

import UIKit
import SDWebImage

class PokemonDetailsViewController: UIViewController {
    

    @IBOutlet weak var myStack: UIStackView!
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    var pokemon : Pokemon?
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonLabelName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let poke = pokemon{
            view.setGradientBackgroundColor(colorOne: (poke.colors[0]), colorTwo: (poke.colors[1]))
            pokemonLabelName.text = poke.name.capitalizingFirstLetter()
            
            //Getting new better image
            let urlString = "https://pokeres.bastionbot.org/images/pokemon/" + String(poke.id) + ".png"
            pokemonImageView.sd_setImage(with: URL(string: urlString))
            
            // Setting pokemon types
            for pokeType in poke.types{
                setPokemonTypeView(type: pokeType, color: poke.colors[0].withAlphaComponent(0.8))
            }
  
        }
        
        
    }
    
    func setPokemonTypeView(type : String, color : UIColor){
        // Creating the view for the pokemon type
        // add the shadow to the base view
        let pokemonTypeView = UIView()
        pokemonTypeView.backgroundColor = UIColor.clear
        pokemonTypeView.layer.shadowColor = UIColor.black.cgColor
        pokemonTypeView.layer.shadowOffset = CGSize(width: 0, height: 1)
        pokemonTypeView.layer.shadowOpacity = 0.1
        pokemonTypeView.layer.shadowRadius = 2.0
        
        // add the border to subview, the one with the border
        let pokemonTypeLabel: PokemonTypeLabel = PokemonTypeLabel()
        pokemonTypeLabel.layer.masksToBounds = true
        pokemonTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        pokemonTypeLabel.backgroundColor = color
        pokemonTypeLabel.textColor = .black
        pokemonTypeLabel.textAlignment = NSTextAlignment.center
        pokemonTypeLabel.text = type.capitalizingFirstLetter()
        pokemonTypeLabel.layer.cornerRadius = 10
        pokemonTypeLabel.layer.borderColor = UIColor.clear.cgColor
        pokemonTypeLabel.layer.borderWidth = 1.0
        pokemonTypeView.addSubview(pokemonTypeLabel)
        
        // Constraints of the label
        let widthLabelConstraint = NSLayoutConstraint(item: pokemonTypeLabel, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: pokemonTypeView, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1, constant: 0)
        
        let heigthLabelConstraint = NSLayoutConstraint(item: pokemonTypeLabel, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: pokemonTypeView, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([widthLabelConstraint, heigthLabelConstraint])
        
        
        myStack.addArrangedSubview(pokemonTypeView)
        
    }
    
    
}
