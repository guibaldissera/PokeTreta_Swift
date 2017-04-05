//
//  MenuJogadorViewController.swift
//  PokeTreta Swift
//
//  Created by Renan Alves on 04/04/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

class MenuJogadorViewController: UIViewController {

    var pokemons = [Pokemon]()
    var player : Gamer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ActionToCapturePokemons(_ sender: Any) {
        
        let jogo = Game.init(name: "kkk")
        
        player?.pokemons.append(jogo.getRandomPokemon())
    }

    @IBAction func ActionToListPokemonsPlayers(_ sender: Any) {
        
        
//        for pokemons in (player?.pokemons)!{
//            
//        }
        
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
