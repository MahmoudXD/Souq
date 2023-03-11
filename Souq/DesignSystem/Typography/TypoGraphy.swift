//
//  TypoGraphy.swift
//  DesignSystem
//
//  Created by Mahmoud Sherbeny on 11/03/2023.
//

import Foundation
import UIKit

extension DesignSystem {
    enum TypoGraphy {
        case title //24.0 , GEMedium
        
        private var fontDescriptor: CustomFontDescriptor {
            switch self {
            case .title:
                return CustomFontDescriptor(font: .geMedium, size: 24.0, style: .title1)
            }
        }
        
        var font: UIFont {
            guard let font = UIFont(name: fontDescriptor.font.name, size: fontDescriptor.size) else {
                return UIFont.preferredFont(forTextStyle: fontDescriptor.style)
            }
            let fontMertix = UIFontMetrics(forTextStyle: fontDescriptor.style)
            return fontMertix.scaledFont(for: font)
        }
    }
}
