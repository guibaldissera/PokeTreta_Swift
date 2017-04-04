//
//  Battle.swift
//  PokeTreta Swift
//
//  Created by Guilherme Baldissera on 04/04/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

class Battle: NSObject {

	var gym : Gym?
	var challenger : Gamer?
	
	init(gym: Gym, challenger: Gamer) {
		super.init()
		
		self.gym = gym
		self.challenger = challenger
	}
	
	func battle() -> Gamer {
		var winner : Gamer
		
		if (self.gym?.leader == nil) {
			winner = self.challenger!
		} else {
			let bestPokesChallenger = self.challenger!.getBestPokemons()
			let bestPokesLeader = self.gym!.leader!.getBestPokemons()
			var score = 0
			
			for i in 0...bestPokesLeader.count {
				let pokeChallenger = bestPokesChallenger[i]
				let pokeLeader = bestPokesLeader[i]
				
				if (pokeChallenger == battlePokemons(pokeChallenger: pokeChallenger, pokeLeader: pokeLeader)) {
					score = score + 1
				} else {
					score = score - 1
				}
			}
			
			if (score > 0) {
				self.gym?.changeLeader(leader: self.challenger!)
				winner = self.challenger!
			} else {
				winner = self.gym!.leader!
			}
		}
		
		self.gym?.changeLeader(leader: winner)
		return winner
	}
	
	func battlePokemons(pokeChallenger: Pokemon, pokeLeader: Pokemon) -> Pokemon {
		let levelDifference = pokeChallenger.getLevel() - pokeLeader.getLevel()
		var winner: Pokemon
		
		if (levelDifference >= 3) {
			giveExpForPokemons(pokeWinner: pokeChallenger, pokeLoser: pokeLeader)
			winner = pokeChallenger
		} else if (levelDifference <= -3) {
			giveExpForPokemons(pokeWinner: pokeLeader, pokeLoser: pokeChallenger)
			winner = pokeLeader
		} else {
			if (comparePokemonTypes(typePokeChallenger: pokeChallenger.type, typePokeLeader: pokeLeader.type) == -1) {
				giveExpForPokemons(pokeWinner: pokeLeader, pokeLoser: pokeChallenger)
				winner = pokeLeader
			} else if (comparePokemonTypes(typePokeChallenger: pokeChallenger.type, typePokeLeader: pokeLeader.type) == 1) {
				giveExpForPokemons(pokeWinner: pokeChallenger, pokeLoser: pokeLeader)
				winner = pokeChallenger
			} else {
				if (arc4random_uniform(100) % 2 == 0) {
					giveExpForPokemons(pokeWinner: pokeChallenger, pokeLoser: pokeLeader)
					winner = pokeChallenger
				} else {
					giveExpForPokemons(pokeWinner: pokeLeader, pokeLoser: pokeChallenger)
					winner = pokeLeader
				}
			}
		}
	
		return winner
	}
	
	func comparePokemonTypes(typePokeChallenger: String, typePokeLeader: String) -> Int {
		var winner = 0
		
		if (typePokeChallenger == "fogo" && typePokeLeader == "agua") {
			winner = -1
		} else if (typePokeChallenger == "fogo" && typePokeLeader == "vento") {
			winner = 1
		} else if (typePokeChallenger == "agua" && typePokeLeader == "vento") {
			winner = -1
		} else if (typePokeChallenger == "agua" && typePokeLeader == "fogo") {
			winner = 1
		} else if (typePokeChallenger == "vento" && typePokeLeader == "fogo") {
			winner = -1
		} else if (typePokeChallenger == "vento" && typePokeLeader == "agua") {
			winner = 1
		} else {
			winner = 0
		}
		
		return winner
	}
	
	func giveExpForPokemons(pokeWinner: Pokemon, pokeLoser: Pokemon) {
		pokeWinner.exp = pokeWinner.exp + 35
		pokeLoser.exp = pokeLoser.exp + 10
	}
}
