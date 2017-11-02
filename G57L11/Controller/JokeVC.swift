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
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		subsribeNotifications()
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		
		unsubsribeNotifications()
	}
	
	func subsribeNotifications() {
		NotificationCenter.default.addObserver(self, selector: #selector(displayJoke(notification:)),
											   name: NSNotification.Name(rawValue: JokeGenerator.jokeReceivedNotification),
											   object: nil)
	}
	
	func unsubsribeNotifications() {
		NotificationCenter.default.removeObserver(self)
	}
	
	@objc func displayJoke(notification: Notification) {
		headerLabel.text =  notification.userInfo?[JokeGenerator.kJokeText] as? String //Date().description
	}
	
	
	
	@IBAction func showJoke() {
		JokeGenerator.getRandomJoke { (joke) in
			self.headerLabel.text = joke
		}
		
	}
	
   
}
