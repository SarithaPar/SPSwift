// Validating email addresses using RawRepresentable and NSDataDetector

import UIKit

struct User: Codable {
	var name: String
	var emailAddress: String
}

enum UserGroup: String {
	case admins
	case moderators
	case regular
}
enum EmailError: String {
	case invalidEmailAddress
	case unexpectedError
}

// Codable: Automatically encoded and decoded to and from our underlying rawValue property
struct EmailAddress: RawRepresentable, Codable {
	let rawValue: String
	
	init?(rawValue: String) {
		// NSDataDetector actually uses regular expressions as well, but hides those details behind a series of dedicated APIs that let us identify tokens like links, phone numbers, and email addresses.
		let detector = try? NSDataDetector(
					types: NSTextCheckingResult.CheckingType.link.rawValue
				)

				let range = NSRange(
					rawValue.startIndex..<rawValue.endIndex,
					in: rawValue
				)

				let matches = detector?.matches(
					in: rawValue,
					options: [],
					range: range
				)
			
				// We only want our string to contain a single email
				// address, so if multiple matches were found, then
				// we fail our validation process and return nil:
				guard let match = matches?.first, matches?.count == 1 else {
					return nil
				}

				// Verify that the found link points to an email address,
				// and that its range covers the whole input string:
				guard match.url?.scheme == "mailto", match.range == range else {
					return nil
				}

				self.rawValue = rawValue
	}
}

class Sign {
	private var emailAddress: String = "sp@gmail.com"
	
	@objc private func handleEmailAddress () {
		let emailPredicate = NSPredicate (
			format: "SELF MATCHES %@", "<regular expression>"
		)
		
//		guard let email = emailAddress, emailAddress.count > 0, emailPredicate.evaluate(with: email) else {
//			return showErrorView(for: .invalidEmailAddress)
//		}
	}
	
	private func showErrorView(for: EmailError){
		print("EmailError")
	}
}
