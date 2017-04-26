//
//  InterappMessage.swift
//  RedirectionData
//
//  Created by Grayson Hansard on 4/25/17.
//
//

import Foundation

fileprivate enum EncoderKeys: String {
	case AppIdentifier = "appIdentifier"
	case xType = "type"
	case Message = "message"
}

@objc(RedirectionDataInterappMessage)
public class InterappMessage: NSObject, NSCoding {
	public let appIdentifier: String // e.g. Redirection.app (v1.0.1)
	public let type: String // "string", "int", "PerformAction"
	public let message: Data

	public init(appIdentifier: String, type: String, message: Data) {
		self.appIdentifier = appIdentifier
		self.type = type
		self.message = message
	}

	required public init?(coder aDecoder: NSCoder) {
		guard
			let appIdentifier = aDecoder.decodeObject(of: NSString.self, forKey: EncoderKeys.AppIdentifier.rawValue) as String?,
			let type = aDecoder.decodeObject(of: NSString.self, forKey: EncoderKeys.xType.rawValue) as String?,
			let message = aDecoder.decodeObject(of: NSData.self, forKey: EncoderKeys.Message.rawValue) as Data?
		else { return nil }

		self.appIdentifier = appIdentifier
		self.type = type
		self.message = message
	}

	public func encode(with aCoder: NSCoder) {
		aCoder.encode(appIdentifier as NSString, forKey: EncoderKeys.AppIdentifier.rawValue)
		aCoder.encode(type as NSString, forKey: EncoderKeys.xType.rawValue)
		aCoder.encode(message as NSData, forKey: EncoderKeys.Message.rawValue)
	}
}

extension InterappMessage : NSSecureCoding {
	public static var supportsSecureCoding: Bool { return true }
}
