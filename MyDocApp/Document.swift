//
//  Document.swift
//  MyDocApp
//
//  Created by Kaz Yoshikawa on 2/25/22.
//

import UIKit

class Document: UIDocument {
	
	var text: String? {
		didSet {
			DispatchQueue.main.async {
				self.updateChangeCount(.done)
			}
		}
	}
	
	override func contents(forType typeName: String) throws -> Any {
		print(Self.self, #function, "typeName=", typeName)
		return self.text?.data(using: .utf8) ?? Data()
	}
	
	override func load(fromContents contents: Any, ofType typeName: String?) throws {
		if let data = contents as? Data {
			self.text = String(data: data, encoding: .utf8)
		}
	}
}

