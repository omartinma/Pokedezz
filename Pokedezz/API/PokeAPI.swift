//
//  PokeAPI.swift
//  Pokedezz
//
//  Created by Oscar Martín on 23/07/2019.
//  Copyright © 2019 Oscar Martín. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public class PokeAPI{
    
    func downloadPokemonData(minPokemon : Int , maxPokemon : Int, completion : @escaping ([Int: Pokemon])->Void) {
        var pokemonDict: [Int: Pokemon] = [:]
        for index in minPokemon...maxPokemon {
            Alamofire.request("https://pokeapi.co/api/v2/pokemon/" + String(index)).responseJSON { response in
                
                // Getting JSON response
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
                pokemonDict[index] = pokemon
                
                if(pokemonDict.count == maxPokemon){
                    // We return the result when as soon as we have all the pokemons download
                    completion(pokemonDict)
                }
            }
    }
    }
}
