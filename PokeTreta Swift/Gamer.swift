//
//  Gamer.swift
//  PokeTreta Swift
//
//  Created by Guilherme Baldissera on 04/04/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

class Gamer: NSObject {

	var name : String = ""
	var pokemons = [Pokemon]()
	
	init(name: String) {
		super.init()
		
		self.name = name
		pokemons = [Pokemon]()
	}
	
	func catchPokemon(newPokemon: Pokemon) -> Bool {
		var catched = false
		
		if (self.pokemons.count > 5) {
			catched = false
		} else {
			let random = arc4random()
			if (random % 2 == 0) {
				self.pokemons.append(newPokemon)
				
				catched = true
			} else {
				catched = false
			}
		}
		
		return catched
	}
	
	func getBestPokemons() -> [Pokemon] {
		var bestPokemons = [Pokemon]()
		
		self.pokemons.sort(by: {$0.exp > $1.exp})
	
		for i in 0...2 {
			let p = pokemons[i]
			bestPokemons.append(p)
		}
		
		return bestPokemons
	}
	
}
