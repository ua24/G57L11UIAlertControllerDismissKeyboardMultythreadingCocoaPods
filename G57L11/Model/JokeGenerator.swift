//
//  JokeGenerator.swift
//  G57L11
//
//  Created by Ivan Vasilevich on 10/31/17.
//  Copyright © 2017 Smoosh Labs. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class JokeGenerator: NSObject {
	
	static let jokeReceivedNotification = "jokeReceivedNotification"
	static let kJokeText = "jokeText"
	
	static func getRandomJoke(completion:((String) -> Swift.Void)? = nil) {
	
		
		// Fetch Request
		Alamofire.request("http://api.icndb.com/jokes/random", method: .get, headers: nil)
			.validate(statusCode: 200..<300)
			.responseJSON { response in
				if (response.result.error == nil) {
//					debugPrint("HTTP Response Body: \(response.data)")
//					let str = NSString.init(data: response.data!, encoding: String.Encoding.utf8.rawValue)
//					print(str)
					let json = JSON(data: response.data!)
					let joke = json["value"]["joke"].string
//					print(joke!)
					NotificationCenter.default.post(name: NSNotification.Name(rawValue: jokeReceivedNotification), object: self, userInfo: [kJokeText: joke])
					completion?(joke!)
				}
				else {
					debugPrint("HTTP Request failed: \(response.result.error)")
				}
		}
	}
	


}
