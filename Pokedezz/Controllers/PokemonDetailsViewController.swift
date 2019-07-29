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
            print(urlString)
            pokemonImageView.sd_setImage(with: URL(string: urlString))
            
            let view1 = UIView()
            view1.backgroundColor = .red
            var yourLabel: UILabel = UILabel()
            //yourLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 21)
            yourLabel.translatesAutoresizingMaskIntoConstraints = false
            yourLabel.backgroundColor = .orange
            yourLabel.textColor = .black
            yourLabel.textAlignment = NSTextAlignment.center
            yourLabel.text = "test label"
            yourLabel.clipsToBounds = true
            view1.addSubview(yourLabel)
            
            
            myStack.addArrangedSubview(view1)
            
            
            
            let view2 = UIView()
            view2.backgroundColor = .blue
            var yourLabel2: UILabel = UILabel()
            //yourLabel2.frame = CGRect(x: 0, y: 0, width: 200, height: 21)
            yourLabel2.translatesAutoresizingMaskIntoConstraints = false
            yourLabel2.backgroundColor = .orange
            yourLabel2.textColor = .black
            yourLabel2.textAlignment = NSTextAlignment.center
            yourLabel2.text = "test label"
            yourLabel2.clipsToBounds = true
            view2.addSubview(yourLabel2)


            myStack.addArrangedSubview(view2)

            
            
        
            
        }
        
        
    }
    
    
    
    
}
