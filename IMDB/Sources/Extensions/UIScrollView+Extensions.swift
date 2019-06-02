//
//  UIScrollView+Extensions.swift
//  IMDB
//
//  Created by Muhammad Abdul Subhan on 30/05/2019.
//  Copyright © 2019 VentureDive. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
    
    /// Method which returns whether a UIScrollView is at bottom or not
    ///
    /// - Returns: bool value
    func isAtBottom() -> Bool {
        return  contentOffset.y > (contentSize.height - frame.height)
    }
}
