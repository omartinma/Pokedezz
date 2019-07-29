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
            
            // Creating the view
            let view1 = UIView()
            view1.backgroundColor = .red
            view1.layer.borderColor = UIColor.black.cgColor
            view1.layer.borderWidth = 1
            view1.layer.cornerRadius = 10
            view1.clipsToBounds = true
            
            
            // Creating the label inside the view
            let yourLabel: PokemonTypeLabel = PokemonTypeLabel()
            yourLabel.translatesAutoresizingMaskIntoConstraints = false
            yourLabel.backgroundColor = .orange
            yourLabel.textColor = .black
            yourLabel.textAlignment = NSTextAlignment.center
            yourLabel.text = "test"
            view1.addSubview(yourLabel)
            
            // Constraints of the label
            let widthLabelConstraint = NSLayoutConstraint(item: yourLabel, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view1, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1, constant: 0)

            let heigthLabelConstraint = NSLayoutConstraint(item: yourLabel, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view1, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: 0)
            NSLayoutConstraint.activate([widthLabelConstraint, heigthLabelConstraint])
  
            
            myStack.addArrangedSubview(view1)
            
            
            
            
            // Creating the view
            let view2 = UIView()
            view2.backgroundColor = .red
            view2.layer.borderColor = UIColor.black.cgColor
            view2.layer.borderWidth = 1
            view2.layer.cornerRadius = 10
            view2.clipsToBounds = true
            
            
            // Creating the label inside the view
            let yourLabel2: PokemonTypeLabel = PokemonTypeLabel()
            yourLabel2.translatesAutoresizingMaskIntoConstraints = false
            yourLabel2.backgroundColor = .orange
            yourLabel2.textColor = .black
            yourLabel2.textAlignment = NSTextAlignment.center
            yourLabel2.text = "test longerrrr"
            view2.addSubview(yourLabel2)
            
            // Constraints of the label
            let widthLabelConstraint2 = NSLayoutConstraint(item: yourLabel2, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view2, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1, constant: 0)
            
            let heigthLabelConstraint2 = NSLayoutConstraint(item: yourLabel2, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view2, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: 0)
            NSLayoutConstraint.activate([widthLabelConstraint2, heigthLabelConstraint2])
            
            
            myStack.addArrangedSubview(view2)
            
            

            
            
            
        
            
        }
        
        
    }
    
    
    
    
}
