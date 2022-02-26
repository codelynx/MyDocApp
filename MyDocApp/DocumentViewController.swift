//
//  DocumentViewController.swift
//  MyDocApp
//
//  Created by Kaz Yoshikawa on 2/25/22.
//

import UIKit

class DocumentViewController: UIViewController {
	
	@IBOutlet weak var textView: UITextView!
	
	var document: Document?
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		// Access the document
		document?.open(completionHandler: { (success) in
			if success {
				self.textView.text = self.document?.text
			} else {
				fatalError()
			}
		})
	}
	
	@IBAction func dismissDocumentViewController() {
		dismiss(animated: true) {
			self.document?.close(completionHandler: nil)
		}
	}

	@IBAction func doneAction(_ sender: Any) {
		self.document?.text = self.textView.text
		self.dismissDocumentViewController()
	}

}
