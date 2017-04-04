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
		
		if (self.gym == nil) {
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
		
		return winner
	}
	
	func battlePokemons(pokeChallenger: Pokemon, pokeLeader: Pokemon) -> Pokemon {
		let levelDifference = pokeChallenger.getLevel() - pokeLeader.getLevel()
		var winner: Pokemon
		
		
		if (levelDifference >= 3) {
			winner = pokeChallenger
		} else {
			if (levelDifference <= -3) {
				winner = pokeLeader
			} else {
//				if (levelDifference < 3 && levelDifference > -3 && ) {
				
//				} else {
				
//				}
				winner = pokeChallenger
			}
		}
		
		return winner
	}
	
	
	
}
