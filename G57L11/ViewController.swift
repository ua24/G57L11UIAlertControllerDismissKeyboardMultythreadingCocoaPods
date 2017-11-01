//
//  ViewController.swift
//  G57L11
//
//  Created by Ivan Vasilevich on 10/31/17.
//  Copyright © 2017 Smoosh Labs. All rights reserved.
//

import UIKit
import SDWebImage
// Threads.
let kBgQ = DispatchQueue.global(qos: .background)
let kMainQueue = DispatchQueue.main

class ViewController: UIViewController {
	
	@IBOutlet weak var imageBox: UIImageView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		if let label1 = view.viewWithTag(1) as? UILabel {
			label1.text = "hello"
		}
		let label1 = view.viewWithTag(1) as? UILabel
		label1?.text = "hello"

	}

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//		view.endEditing(true)
		
		showAlert()
	}
	
	func showAlert() {
		let alertController = UIAlertController(title: "Title", message: "message tut piwut", preferredStyle: .actionSheet)
		let okAct = UIAlertAction(title: "ok", style: .default) { (act) in
//			self.downloadImage()
		}
		alertController.addAction(okAct)
		
		let cancellAct = UIAlertAction(title: "cancel", style: .cancel) { (act) in
			print("dratute")
		}
		alertController.addAction(cancellAct)
		
		present(alertController, animated: true) {
			print("YAZZ22")
		}
		
	}
	
	@IBAction func downloadAndPresentImageFromButtonTile(_ sender: UIButton) {
//		downloadImage(link: sender.currentTitle!)
		imageBox.sd_setImage(with: URL.init(string: sender.currentTitle!)!, completed: nil)
	}
//	func downloadImage(link:String = "http://speedhunters-wp-production.s3.amazonaws.com/wp-content/uploads/2017/10/30143143/Louis_Yio_2017_Speedhunters_CSF_EvoX_064.jpg") {
//		kBgQ.async {
//			print("download started")
////			let link = "http://speedhunters-wp-production.s3.amazonaws.com/wp-content/uploads/2017/10/30143143/Louis_Yio_2017_Speedhunters_CSF_EvoX_064.jpg"
//			let url = URL(string: link)!
//			let data = NSData.init(contentsOf: url)!
//			let image = UIImage(data: data as Data)
//			let color = UIColor.init(patternImage: image!)
//			kMainQueue.async {
//				self.imageBox.image = image
//				self.view.backgroundColor = color
//			}
//
//			print("download finished")
//		}
//		print("ololo")
//	}


}

