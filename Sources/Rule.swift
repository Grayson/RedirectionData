//
//  Rule.swift
//  data
//
//  Created by Grayson Hansard on 4/18/17.
//
//

public struct Rule {
	public let browserIdentifier: BundleIdentifier
	public let match: Match
}

extension Rule: Equatable {}
public func ==(left: Rule, right: Rule) -> Bool {
	return left.browserIdentifier == right.browserIdentifier
		&& left.match == right.match
}
