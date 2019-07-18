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
    var pokemonDict: [Int: String] = [:]
    let minPokemon = 1
    let maxPokemon = 5
    
    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    func downloadDataFromAPI(completion : @escaping ()->Void){
        
        for index in minPokemon...maxPokemon {
            Alamofire.request("https://pokeapi.co/api/v2/pokemon/" + String(index)).responseJSON { response in
                
                let swiftyJsonVar = JSON(response.data!)
                let pokemonName = swiftyJsonVar["name"].string
                if let pokemonName = pokemonName {
                    self.pokemonDict[index] = pokemonName
                }
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
                print("Total pokemon: " + String(self.pokemonDict.count))
                self.pokemonCollectionView.reloadData()
                // Iterate in dictionary
            
//                for index in self.minPokemon...self.maxPokemon {
//
//                }
                
        })
    }
    
    // Mark: Collection view methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Total pokemon: " + String(self.pokemonDict.count))
        return pokemonDict.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "PokemonCollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! PokemonCollectionViewCell
        let pokemon = pokemonDict[indexPath.row+1]
        print(indexPath.row)
        cell.pokemonNameLabel.text = pokemon
        
        return cell
    }
    
    
    func add2Views(){
        // Testing how to add views by code
        let rect = CGRect(x: 10, y: 100, width: 100, height: 100)
        var myView = UIView(frame: rect)
        myView.backgroundColor = UIColor.purple
        myView.layer.cornerRadius = 20.0
        myView.layer.shadowColor = UIColor.gray.cgColor
        myView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        myView.layer.shadowRadius = 12.0
        myView.layer.shadowOpacity = 0.7
        
        let rectLabel = CGRect(x: 0, y: 10, width: 100, height: 20)
        var label = UILabel(frame: rectLabel)
        label.text = "sdasdsa"
        label.textAlignment = NSTextAlignment.center
        
        myView.addSubview(label)
        self.view.addSubview(myView)
        
        
        let rect2 = CGRect(x: 10, y: 200, width: 100, height: 100)
        var myView2 = UIView(frame: rect2)
        myView2.backgroundColor = UIColor.purple
        myView2.layer.cornerRadius = 20.0
        myView2.layer.shadowColor = UIColor.gray.cgColor
        myView2.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        myView2.layer.shadowRadius = 12.0
        myView2.layer.shadowOpacity = 0.7
        
        let rectLabel2 = CGRect(x: 0, y: 10, width: 100, height: 20)
        var label2 = UILabel(frame: rectLabel2)
        label2.text = "sdasdsa"
        label2.textAlignment = NSTextAlignment.center
        
        myView2.addSubview(label2)
        self.view.addSubview(myView2)
    }
    
}

