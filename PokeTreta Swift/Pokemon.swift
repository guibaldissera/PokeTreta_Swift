//
//  Pokemon.swift
//  PokeTreta Swift
//
//  Created by Guilherme Baldissera on 04/04/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

class Pokemon: NSObject {

	var name : String = ""
	var type : Int = 0
	var exp : Int = 0
	
	init(name: String, type: Int, experience: Int) {
		super.init()
		
		self.name = name
		self.type = type
		self.exp = experience
		
	}
	
	func addExp(experience: Int) {
		self.exp = self.exp + experience
	}
	
	func getLevel() -> Int {
		return self.exp / 100
	}
	
}
