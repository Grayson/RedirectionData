//
//  LogMessage.swift
//  RedirectionData
//
//  Created by Grayson Hansard on 4/25/17.
//
//

import Foundation

public struct LogMessage {
	typealias Severity = LogMessageSeverity

	let severity: Severity
	let message: String
}
