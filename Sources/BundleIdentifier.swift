//
//  BundleIdentifier.swift
//  data
//
//  Created by Grayson Hansard on 4/18/17.
//
//

import Foundation

public struct BundleIdentifier {
	public let value: String
}

extension BundleIdentifier: Equatable {}
public func ==(left: BundleIdentifier, right: BundleIdentifier) -> Bool {
	return left.value == right.value
}
