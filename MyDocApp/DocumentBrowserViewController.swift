//
//  DocumentBrowserViewController.swift
//  MyDocApp
//
//  Created by Kaz Yoshikawa on 2/25/22.
//

import UIKit


class DocumentBrowserViewController: UIDocumentBrowserViewController, UIDocumentBrowserViewControllerDelegate {
	
//	override var allowedContentTypes: [String] {
//		return ["com.electricwoods.text"]
////		return ["public.text"]
//	}
	
	static let untitledKey = "Untitled"
	static let pathExtension = "txt"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.delegate = self
		self.allowsDocumentCreation = true
		self.allowsPickingMultipleItems = false

		// Update the style of the UIDocumentBrowserViewController
		// browserUserInterfaceStyle = .dark
		// view.tintColor = .white
		
		// Specify the allowed content types of your application via the Info.plist.
		
		// Do any additional setup after loading the view.
	}
	
	
	// MARK: UIDocumentBrowserViewControllerDelegate
	
	func documentBrowser(_ controller: UIDocumentBrowserViewController, didRequestDocumentCreationWithHandler importHandler: @escaping (URL?, UIDocumentBrowserViewController.ImportMode) -> Void) {
	
		guard let untitledFileURL = Bundle.main.url(forResource: Self.untitledKey, withExtension: Self.pathExtension) else { fatalError() }
		importHandler(untitledFileURL, .move)
	}
	
	func documentBrowser(_ controller: UIDocumentBrowserViewController, didPickDocumentsAt documentURLs: [URL]) {
		guard let sourceURL = documentURLs.first else { return }
		
		// Present the Document View Controller for the first document that was picked.
		// If you support picking multiple items, make sure you handle them all.
		presentDocument(at: sourceURL)
	}
	
	func documentBrowser(_ controller: UIDocumentBrowserViewController, didImportDocumentAt sourceURL: URL, toDestinationURL destinationURL: URL) {
		// Present the Document View Controller for the new newly created document
		presentDocument(at: destinationURL)
	}
	
	func documentBrowser(_ controller: UIDocumentBrowserViewController, failedToImportDocumentAt documentURL: URL, error: Error?) {
		// Make sure to handle the failed import appropriately, e.g., by presenting an error message to the user.
	}
	
	// MARK: Document Presentation
	
	func presentDocument(at documentURL: URL) {
		
		let storyBoard = UIStoryboard(name: "Main", bundle: nil)
		let documentViewController = storyBoard.instantiateViewController(withIdentifier: "DocumentViewController") as! DocumentViewController
		documentViewController.document = Document(fileURL: documentURL)
		let navigationController = UINavigationController(rootViewController: documentViewController)
		navigationController.modalPresentationStyle = .fullScreen
		
		present(navigationController, animated: true, completion: nil)
	}
}

