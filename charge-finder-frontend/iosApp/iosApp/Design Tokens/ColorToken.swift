import SwiftUI

enum ColorToken {
    case accent
    case background
    case text
    case secondary
}

fileprivate extension ColorToken {
    var hexValue: UIColor.Hex {
        switch self {
        case .accent: return 0xFFC107
        case .background: return 0xF5F5F5
        case .text: return 0x333333
        case .secondary: return 0x6C757D
        }
    }
}

extension Color {
    static func palette(_ colorToken: ColorToken) -> Color {
        Color(UIColor(hex: colorToken.hexValue, alpha: 1))
    }
}
