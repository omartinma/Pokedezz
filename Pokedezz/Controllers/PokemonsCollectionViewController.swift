//
//  PokemonsCollectionViewController.swift
//  Pokedezz
//
//  Created by Oscar Martín on 16/07/2019.
//  Copyright © 2019 Oscar Martín. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import SwiftyJSON
import ViewAnimator

class PokemonsCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let minPokemon = 1
    let maxPokemon = 10
    var pokemonDict: [Int: Pokemon] = [:]
    
    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pokemonCollectionView.isPrefetchingEnabled = false
        // Do any additional setup after loading the view.
        //let animation1 = AnimationType.from(direction: .left, offset: 300)
        let animation2 = AnimationType.zoom(scale: 0.1)

       pokemonCollectionView.animate(animations: [animation2], reversed: false, initialAlpha: 1, finalAlpha: 1, delay: 0, duration: 1.5, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIView.AnimationOptions.allowAnimatedContent, completion: nil)
    
        
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is PokemonDetailsViewController{
            let vc = segue.destination as? PokemonDetailsViewController
            //vc?.transitioningDelegate = self uncomment to custom delegate for animation in presentation
            var index = self.pokemonCollectionView.indexPathsForSelectedItems?.first
            vc?.pokemon = pokemonDict[index!.row+1]
        }
    }
    
}

extension PokemonsCollectionViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController)
        -> UIViewControllerAnimatedTransitioning? {
            let att = self.pokemonCollectionView.layoutAttributesForItem(at: self.pokemonCollectionView.indexPathsForSelectedItems!.first!)
            print(att!.frame)
            let newFrame = CGRect(x: 90, y: 203, width: 193, height: 212)
            return FlipPresentAnimationController(originFrame: newFrame)
    }
}

