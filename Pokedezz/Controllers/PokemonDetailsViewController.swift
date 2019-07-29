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
        }
  
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
