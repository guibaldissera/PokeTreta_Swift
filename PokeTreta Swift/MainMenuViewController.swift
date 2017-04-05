//
//  MainMenuViewController.swift
//  PokeTreta Swift
//
//  Created by Leonel Menezes on 04/04/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
	
	var game: Game!

    override func viewDidLoad() {
        super.viewDidLoad()
		
		if (game != nil) {
			NSLog("Game name %@", self.game.name)
		} else {
			NSLog("Game dont exist")
		}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if (segue.identifier == "segueToMainPlayer") {
            
            let MenuJogadorViewController = segue.destination as! MenuJogadorViewController
            
            
            
            let g = game.player
            MenuJogadorViewController.player = g
            
            let a = game.pokemons
            MenuJogadorViewController.pokemons = a
        }
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
