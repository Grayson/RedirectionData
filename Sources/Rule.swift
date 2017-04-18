//
//  Rule.swift
//  data
//
//  Created by Grayson Hansard on 4/18/17.
//
//

public struct Rule {
	let browserIdentifier: BundleIdentifier
	let match: Match
}

extension Rule: Equatable {}
public func ==(left: Rule, right: Rule) -> Bool {
	return left.browserIdentifier == right.browserIdentifier
		&& left.match == right.match
}
