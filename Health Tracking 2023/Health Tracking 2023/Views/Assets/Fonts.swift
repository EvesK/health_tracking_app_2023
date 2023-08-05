//
//  Fonts.swift
//  Health Tracking 2023
//
//  Created by Evelyn on 8/5/23.
//

import Foundation
import SwiftUI

extension Font {
    public static var largeTitle: Font {
        return Font.custom("OpenSans-Regular", size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize)
    }

    public static var title1: Font {
        return Font.custom("OpenSans-Regular", size: UIFont.preferredFont(forTextStyle: .title1).pointSize)
    }
    
    public static var title2: Font {
        return Font.custom("OpenSans-Regular", size: UIFont.preferredFont(forTextStyle: .title2).pointSize)
    }
    
    public static var title3: Font {
        return Font.custom("OpenSans-Regular", size: UIFont.preferredFont(forTextStyle: .title3).pointSize)
    }
    
    public static var body: Font {
        return Font.custom("OpenSans-Regular", size: UIFont.preferredFont(forTextStyle: .body).pointSize)
    }
}
