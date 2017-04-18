//
//  Match.swift
//  data
//
//  Created by Grayson Hansard on 4/18/17.
//
//

import Foundation

private func does(string: String?, matchRegex pattern: String) -> Bool {
	guard let string = string else { return false }
	let regex = try! NSRegularExpression(pattern: pattern, options: [.caseInsensitive])
	let matchRange = regex.rangeOfFirstMatch(in: string, options: [], range: NSMakeRange(0, string.characters.count))
	return matchRange.location != NSNotFound
}

struct Match {
	let type: MatchType
	let test: String

	func matches(_ string: String) -> Bool {
		switch(type) {
		case .contains:
			return string.contains(test)
		case .startsWith:
			return string.hasPrefix(test)
		case .endsWith:
			return string.hasSuffix(test)
		case .hasExtension:
			return (string as NSString).pathExtension == string
		case .regexMatch:
			return does(string: string, matchRegex: test)
		case .schemeIs:
			return URL(string: string)?.scheme == test
		case .userIs:
			return URL(string: string)?.user == test
		case .hostIs:
			return URL(string: string)?.host == test
		case .hostMatchesRegex:
			return does(string: URL(string: string)?.host, matchRegex: test)
		case .portIs:
			return URL(string: string)?.port == (Int(test) ?? Int.min)
		case .pathIs:
			return URL(string: string)?.path == test
		case .pathMatchesRegex:
			return does(string: URL(string: string)?.path, matchRegex: test)
		case .fragmentIs:
			return URL(string: string)?.fragment == test
		case .fragmentMatchesRegex:
			return does(string: URL(string: string)?.fragment, matchRegex: test)
		case .queryIs:
			return URL(string: string)?.query == test
		case .queryMatchesRegex:
			return does(string: URL(string: string)?.query, matchRegex: test)
		}
	}
}

extension Match: Equatable {}
func ==(left: Match, right: Match) -> Bool {
	return left.type == right.type
		&& left.test == right.test
}
