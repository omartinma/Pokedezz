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
import CoreData

public class PokeAPI{
    
    let pokemonEntityKey : String = "PokemonDB"
    let pokemonIdKey : String = "id"
    let pokemonNameKey : String = "name"
    let pokemonImageUrlKey : String = "imageURL"
    let pokemonTypesKey : String = "types"
    
    
    func createPokemonDB(pokemon : Pokemon){
        
        //As we know that container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //Now let’s create an entity and new pokemon records.
        let pokemonEntity = NSEntityDescription.entity(forEntityName: self.pokemonEntityKey, in: managedContext)!
        
        //final, we need to add some data to our newly created record for each keys using
        
        let pokemonRecord = NSManagedObject(entity: pokemonEntity, insertInto: managedContext)
        pokemonRecord.setValue(pokemon.id, forKeyPath: self.pokemonIdKey)
        pokemonRecord.setValue(pokemon.name, forKeyPath: self.pokemonNameKey)
        pokemonRecord.setValue(pokemon.imageUrl, forKeyPath: self.pokemonImageUrlKey)
        pokemonRecord.setValue(pokemon.types, forKeyPath: self.pokemonTypesKey)

        //Now we have set all the values. The next step is to save them inside the Core Data
        
        do {
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
//    func retrieveAllPokemon() {
//
//        //As we know that container is set up in the AppDelegates so we need to refer that container.
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//
//        //We need to create a context from this container
//        let managedContext = appDelegate.persistentContainer.viewContext
//
//        //Prepare the request of type NSFetchRequest  for the entity
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: pokemonEntityKey)
//
//        do {
//            let result = try managedContext.fetch(fetchRequest)
//            for data in result as! [NSManagedObject] {
//                print(data.value(forKey: self.pokemonIdKey) as! Int)
//            }
//
//        } catch {
//
//            print("Failed")
//        }
//    }
//
//    func isPokemonSaved(id : Int) -> Bool {
//        //As we know that container is set up in the AppDelegates so we need to refer that container.
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return false}
//
//        //We need to create a context from this container
//        let managedContext = appDelegate.persistentContainer.viewContext
//
//        //Prepare the request of type NSFetchRequest  for the entity
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: self.pokemonEntityKey)
//        fetchRequest.predicate = NSPredicate(format: "id = %d", id)
//
//        do {
//            let result = try managedContext.fetch(fetchRequest)
//            return result.count > 0
//        } catch {
//            print("Failed")
//            return false
//        }
//    }
    
    func getPokemon(id : Int) -> Pokemon? {
        //As we know that container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil}
        
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //Prepare the request of type NSFetchRequest  for the entity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: self.pokemonEntityKey)
        fetchRequest.predicate = NSPredicate(format: "id = %d", id)
        
        var pokemon : Pokemon?
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            if result.count > 0{
                let pokemonDB = result[0] as! NSManagedObject
                pokemon = Pokemon()
                pokemon!.id =  pokemonDB.value(forKey: self.pokemonIdKey) as! Int
                pokemon!.name =  pokemonDB.value(forKey: self.pokemonNameKey) as! String
                pokemon!.imageUrl =  pokemonDB.value(forKey: self.pokemonImageUrlKey) as! String
                pokemon!.types =  pokemonDB.value(forKey: self.pokemonTypesKey) as! [String]
            }
            
        } catch {
            print("Failed")
            
        }
        return pokemon
    }
    
    
    
    func downloadPokemonData(minPokemon : Int , maxPokemon : Int, completion : @escaping ([Int: Pokemon])->Void) {
        var pokemonDict: [Int: Pokemon] = [:]
        for index in minPokemon...maxPokemon {
            //var isAdded = isPokemonSaved(id: index)
            let pokemon = getPokemon(id: index)
            if pokemon !=  nil {
                pokemonDict[index] = pokemon
                if index == maxPokemon{
                     completion(pokemonDict)
                }
            }
            else {
                Alamofire.request("https://pokeapi.co/api/v2/pokemon/" + String(index)).responseJSON { response in
                    
                    // Getting JSON response
                    let swiftyJsonVar = JSON(response.data!)
                    
                    // Name
                    let pokemonName = swiftyJsonVar["name"].string
                    
                    // Images
                    let pokemonImagesJson = swiftyJsonVar["sprites"]
                    let defaultImage = pokemonImagesJson["front_default"].string
                    
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
                    pokemon.id = index
                    pokemonDict[index] = pokemon
                    self.createPokemonDB(pokemon: pokemon)
                    if(pokemonDict.count == maxPokemon){
                        // We return the result when as soon as we have all the pokemons download
                        completion(pokemonDict)
                    }
                }
            }
        }
    }
}
