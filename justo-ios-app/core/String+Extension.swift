import Foundation
import UIKit

extension String {

    static func localizeString(for text: String, argument: String = StringConstants.empty) -> String {
        return String.localizedStringWithFormat(NSLocalizedString(text, comment: StringConstants.empty), argument)
    }
    
    func asAttributedText(with font: UIFont = .bodyRegular(),
                          color: UIColor = .black,
                          spacing: CGFloat = Constants.defaultLetterSpacing) -> NSAttributedString {
        return NSAttributedString(string: self, attributes: [NSAttributedString.Key.font: font,
                                                             NSAttributedString.Key.foregroundColor: color,
                                                             NSAttributedString.Key.kern: spacing ])
    }
    
    func withAttributedRange(of stringToFormat: String,
                             font: UIFont = .bodyBold(),
                             color: UIColor = .black) -> NSAttributedString {
        let range = (self as NSString).range(of: stringToFormat)
        
        let attributedString = NSMutableAttributedString.init(string: self)
        attributedString.addAttributes([NSAttributedString.Key.foregroundColor: color,
                                        NSAttributedString.Key.font: font], range: range)
        
        return attributedString
    }
    
    var fromHtmlToText: NSAttributedString? {
        do {
            guard let data = data(using: String.Encoding.utf8) else {
                return nil
            }
            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            return nil
        }
    }

    func asURL() -> URL {
        return URL.init(safeString: self)
    }
    
    static func asFormattedDate(_ stringDate: String) -> String {
        return DateFormatter.formatDate(with: stringDate)
    }
    
}

extension Optional where Wrapped == String {

    func orDefaultString() -> String {
        return self ?? ""
    }
}

extension Optional where Wrapped == [String] {

    func orDefaultArray() -> [String] {
        return self ?? []
    }
}
