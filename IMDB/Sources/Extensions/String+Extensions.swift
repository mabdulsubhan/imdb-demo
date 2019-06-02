//
//  String+Extensions.swift
//  IMDB
//
//  Created by Muhammad Abdul Subhan on 31/05/2019.
//  Copyright © 2019 VentureDive. All rights reserved.
//

import UIKit

extension String {
    
    
    /// Adds a 'See more' at the end of the string with a max length
    ///
    /// - Parameter maxLength: Max length of the string to not truncate
    /// - Returns: NSAttributedString with a bolded see more added
    func addSeeMore(maxLength: Int) -> NSAttributedString {
        if maxLength > count {
            return NSAttributedString(string: self)
        }
        var attributedString = NSMutableAttributedString()
        let ind: String.Index = index(startIndex, offsetBy: maxLength)
        let seeMoreText = "... See More"
        let editedText = String(prefix(upTo: ind)) + seeMoreText
        attributedString = NSMutableAttributedString(string: editedText)
        attributedString.addAttributes([.font : UIFont.boldSystemFont(ofSize: 13)], range: NSRange(location: editedText.count - seeMoreText.count, length: seeMoreText.count))
        
        return attributedString
    }
}
