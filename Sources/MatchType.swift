//
//  MatchType.swift
//  data
//
//  Created by Grayson Hansard on 4/18/17.
//
//

import Foundation

public enum MatchType: Int {
	case contains
	case startsWith
	case endsWith
	case hasExtension
	case regexMatch
	case schemeIs
	case userIs
	case hostIs
	case hostMatchesRegex
	case portIs
	case pathIs
	case pathMatchesRegex
	case fragmentIs
	case fragmentMatchesRegex
	case queryIs
	case queryMatchesRegex
}
