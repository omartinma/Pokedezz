//
//  ViewController.swift
//  Pokedezz
//
//  Created by Oscar Martín on 16/07/2019.
//  Copyright © 2019 Oscar Martín. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let minPokemon = 1
    let maxPokemon = 10
    var pokemonDict: [Int: Pokemon] = [:]
    
    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let pokeApi = PokeAPI()
        pokeApi.downloadPokemonData(minPokemon: minPokemon, maxPokemon: maxPokemon, completion:
            {_data in
                self.pokemonDict = _data
                self.pokemonCollectionView.reloadData()
        })
    }
    
    // Mark: Collection view methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonDict.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "PokemonCollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! PokemonCollectionViewCell
        let pokemon = pokemonDict[indexPath.row+1]
        cell.setUpContent(pokemon: pokemon)
        
        return cell
    }
    
    
    
    
}

