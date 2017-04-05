//
//  Game.swift
//  PokeTreta Swift
//
//  Created by Guilherme Baldissera on 04/04/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit
let TYPE_FIRE = "fogo"
let TYPE_WIND = "vento"
let TYPE_WATER = "agua"

class Game: NSObject {
	
	var name : String = ""
	var player : Gamer?
	var pokemons = [Pokemon]()
	var gamers = [Gamer]()
	var gyms = [Gym]()
	
	init(name: String) {
		super.init()
		
		self.name = name
		self.player = Gamer.init(name: "Maria Jose")
		
		self.pokemons = createPokemon()
		self.gamers = createGamers()
		self.gyms = createGyms()
        
        self.saveInstanceInArchive()
	}
	
	func createPokemon() -> [Pokemon] {
		let pokemonNames = ["Pikachu", "Charizard", "Entei", "Blastoise", "Pidgey"]
		let pokemonTypes = [TYPE_FIRE, TYPE_WIND, TYPE_WATER]
	
		var newPokemons = [Pokemon]()
	
		for poke in pokemonNames {
			newPokemons.append(Pokemon.init(name: poke, type: pokemonTypes[Int(arc4random_uniform(100) % 3)], experience: Int(arc4random_uniform(5000))))
		}
	
		return newPokemons
	}
	
	func createGamers() -> [Gamer] {
		let gamerNames = ["Ash", "Broke", "Tina", "Joana", "Irineu"]
		
		var newGamers = [Gamer]()
		
		for gamer in gamerNames {
			newGamers.append(Gamer.init(name: gamer))
		}
		
		return newGamers
	}
	
	func createGyms() -> [Gym] {
		let gymNames = ["BEPiD", "Coca-Cola", "Metrô", "Casa das Prima", "American Show"]
		
		var newGyms = [Gym]()
		
		for gym in gymNames {
			newGyms.append(Gym.init(name: gym))
		}
		
		return newGyms
	}
	
	func getRandomPokemon() -> Pokemon {
		let p = pokemons[Int(arc4random_uniform(UInt32(pokemons.count)))]
		let pokeNew = Pokemon.init(name: p.name, type: p.type, experience: p.exp)
		return pokeNew
	}
    
    func saveInstanceInArchive(){
        
        let array = NSArray()
        
        for pokemon in self.pokemons{
            array.adding(pokemon)
        }
        
        array.write(toFile: "/temp/listPokemons.plist", atomically: true)
    }
}
