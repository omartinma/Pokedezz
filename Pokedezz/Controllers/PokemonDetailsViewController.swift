//
//  PokemonDetailsViewController.swift
//  Pokedezz
//
//  Created by Oscar Martín on 23/07/2019.
//  Copyright © 2019 Oscar Martín. All rights reserved.
//

import UIKit

class PokemonDetailsViewController: UIViewController {

    var pokemon : Pokemon?
    override func viewDidLoad() {
        super.viewDidLoad()
        print(pokemon?.name)
        view.setGradientBackgroundColor(colorOne: (pokemon?.colors[0])!, colorTwo: (pokemon?.colors[1])!)
        // Do any additional setup after loading the view.
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
