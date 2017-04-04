//
//  Gym.swift
//  PokeTreta Swift
//
//  Created by Guilherme Baldissera on 04/04/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

class Gym: NSObject {

	var name: String = ""
	var leader: Gamer?
	
	init(name: String) {
		super.init()
		
		self.name = name
	}
	
	init(name: String, leader: Gamer) {
		super.init()
		
		self.name = name
		self.leader = leader
	}
	
	func changeLeader(leader: Gamer) {
		self.leader = leader
	}
}
