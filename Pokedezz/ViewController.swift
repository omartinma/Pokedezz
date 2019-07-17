//
//  ViewController.swift
//  Pokedezz
//
//  Created by Oscar Martín on 16/07/2019.
//  Copyright © 2019 Oscar Martín. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    var pokemonDict: [Int: String] = [:]
    
    func downloadDataFromAPI(completion : @escaping ()->()){
        
        for index in 1...5 {
            Alamofire.request("https://pokeapi.co/api/v2/pokemon/" + String(index)).responseJSON { response in
                
                let swiftyJsonVar = JSON(response.data!)
                let pokemonName = swiftyJsonVar["name"].string
                if let pokemonName = pokemonName {
                    self.pokemonDict[index] = pokemonName
                }
                if(self.pokemonDict.count == 5){
                    // When we finish to iterate
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
                print(self.pokemonDict.count)
        })
    }
    
    
}

