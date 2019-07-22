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
    var pokemonDict: [Int: Pokemon] = [:]
    let minPokemon = 1
    let maxPokemon = 15
    
    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    func downloadDataFromAPI(completion : @escaping ()->Void){
        
        for index in minPokemon...maxPokemon {
            Alamofire.request("https://pokeapi.co/api/v2/pokemon/" + String(index)).responseJSON { response in
                
                let swiftyJsonVar = JSON(response.data!)
                
                // Name
                let pokemonName = swiftyJsonVar["name"].string
                
                // Images
                let pokemonImagesJson = swiftyJsonVar["sprites"]
                let defaultImage = pokemonImagesJson["back_default"].string
                
                // Types
                var arrayTypes = [String]()
                let pokemonTypesJson = swiftyJsonVar["types"].arrayObject
                if pokemonTypesJson != nil{
                    for typeIndex in 0...pokemonTypesJson!.count-1{
                        let typeJson = pokemonTypesJson![typeIndex] as! [String : Any]
                        let type = typeJson["type"] as! [String : Any]
                        let typeName = type["name"]
                        arrayTypes.append(typeName as! String)
                    }
                }
                
                
                let pokemon = Pokemon()
                pokemon.name = pokemonName!
                pokemon.imageUrl = defaultImage!
                pokemon.types = arrayTypes
                self.pokemonDict[index] = pokemon
                
                if(self.pokemonDict.count == self.maxPokemon){
                    completion()
                }
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        downloadDataFromAPI(completion:
            {
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

