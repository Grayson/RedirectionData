//
//  Communicator.swift
//  RedirectionData
//
//  Created by Grayson Hansard on 4/25/17.
//
//

import Foundation

@objc public protocol Communicator {
	func ping(_ pong: () -> ())
	func handle(message: InterappMessage)
	func update(rules: [EncodableRule])
	func log(messages: [EncodableLogMessage])
}
