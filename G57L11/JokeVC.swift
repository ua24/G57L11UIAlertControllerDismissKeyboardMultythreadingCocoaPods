//
//  JokeVC.swift
//  G57L11
//
//  Created by Ivan Vasilevich on 10/31/17.
//  Copyright © 2017 Smoosh Labs. All rights reserved.
//

import UIKit

class JokeVC: UIViewController {

	@IBOutlet weak var headerLabel: UILabel!
	
	@IBAction func showJoke() {
		JokeGenerator.getRandomJoke()
	}
	
   
}
