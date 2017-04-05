//
//  ViewController.swift
//  PokeTreta Swift
//
//  Created by Guilherme Baldissera on 04/04/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

class InicioViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
//		let defaults = UserDefaults.standard
		
//		let g = Game.init(name: "Jogo do pokemon massa")
		
//		defaults.set(g, forKey: "gameInstance")
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		
		if (segue.identifier == "segueToMainMenuViewController") {
			
			let mainMenuViewController = segue.destination as! MainMenuViewController
			
			//let mainMenuViewController:MainMenuViewController = segue.destination as! MainMenuViewController
			
			
			
			let g = Game.init(name: "Jogo do pokemon massa")
			mainMenuViewController.game = g
			
		}
	}
}

