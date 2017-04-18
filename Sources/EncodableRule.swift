//
//  EncodableRule.swift
//  data
//
//  Created by Grayson Hansard on 4/18/17.
//
//

import Foundation

fileprivate enum EncoderKeys: String {
	case BrowserIdentifier = "browserIdentifier"
	case MatchType = "match.type"
	case MatchTest = "match.test"
}

@objc(RedirectionDataEncodableRule)
public class EncodableRule : NSObject, NSCoding {
	public let rule: Rule

	public init(_ rule: Rule) {
		self.rule = rule
	}

	required public init?(coder aDecoder: NSCoder) {
		guard
			let browserIdentifier = aDecoder.decodeObject(of: NSString.self, forKey: EncoderKeys.BrowserIdentifier.rawValue) as String?,
			let matchTypeValue = aDecoder.decodeObject(of: NSNumber.self, forKey: EncoderKeys.MatchType.rawValue) as? Int,
			let matchType = MatchType(rawValue: matchTypeValue),
			let matchTest = aDecoder.decodeObject(of: NSString.self, forKey: EncoderKeys.MatchTest.rawValue) as String?
		else { return nil }

		self.rule = Rule(browserIdentifier: BundleIdentifier(value: browserIdentifier), match: Match(type: matchType, test: matchTest))
	}

	public func encode(with aCoder: NSCoder) {
		aCoder.encode(rule.browserIdentifier.value as NSString, forKey: EncoderKeys.BrowserIdentifier.rawValue)
		aCoder.encode(rule.match.type.rawValue, forKey: EncoderKeys.MatchType.rawValue)
		aCoder.encode(rule.match.test as NSString, forKey: EncoderKeys.MatchTest.rawValue)
	}
}

extension EncodableRule : NSSecureCoding {
	public static var supportsSecureCoding: Bool { return true }
}
