//
//  BrowserInfo.swift
//  RedirectionData
//
//  Created by Grayson Hansard on 4/27/17.
//
//

import Foundation

public struct BrowserInfo {
	public let name: String
	public let location: URL
	public let identifier: String
}

extension BrowserInfo : Equatable {}
public func ==(lhs: BrowserInfo, rhs: BrowserInfo) -> Bool {
	return lhs.name == rhs.name
		&& lhs.location == rhs.location
		&& lhs.identifier == rhs.identifier
}

private func fetchName(from dictionary: [String: Any?]?) -> String? {
	guard let dictionary = dictionary else { return nil }
	let value: Any? = dictionary["CFBundleDisplayName"]
		?? dictionary["CFBundleName"]
		?? nil
	return value as? String
}

private func convertBundleToBrowserInfo(url: URL) -> BrowserInfo?
{
	guard
		let bundle = Bundle(url: url),
		let identifier = bundle.bundleIdentifier,
		let name = fetchName(from: bundle.localizedInfoDictionary) ?? fetchName(from: bundle.infoDictionary)
		else { return nil }
	return BrowserInfo(name: name, location: bundle.bundleURL, identifier: identifier)
}

public func fetchInfoForPotentialBrowsers() -> [BrowserInfo] {
	if let url = NSURL(string: "http://"),
		let browsersTmp = LSCopyApplicationURLsForURL(url, LSRolesMask.all),
		let browsers = browsersTmp.takeUnretainedValue() as? [URL] {
		return browsers.flatMap(convertBundleToBrowserInfo)
	}
	return []
}

