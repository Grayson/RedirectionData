//
//  EncodableLogMessage.swift
//  RedirectionData
//
//  Created by Grayson Hansard on 4/25/17.
//
//

import Foundation

fileprivate enum EncoderKeys: String {
	case Severity = "severity"
	case Message = "message"
}

public class EncodableLogMessage: NSObject, NSCoding {
	public let message: LogMessage

	public init(_ message: LogMessage) {
		self.message = message
	}

	public required init?(coder aDecoder: NSCoder) {
		guard
			let severityString = aDecoder.decodeObject(of: NSString.self, forKey: EncoderKeys.Severity.rawValue) as String?,
			let severity = LogMessage.Severity(rawValue: severityString),
			let message = aDecoder.decodeObject(of: NSString.self, forKey: EncoderKeys.Message.rawValue) as String?
		else { return nil }

		self.message = LogMessage(severity: severity, message: message)
	}

	public func encode(with aCoder: NSCoder) {
		aCoder.encode(message.severity.rawValue as String, forKey: EncoderKeys.Severity.rawValue)
		aCoder.encode(message.message as String, forKey: EncoderKeys.Message.rawValue)
	}
}
