//
//  ConstantsAndExtensions.swift
//  FruitHub
//
//  Created by Yudiz Solutions Ltd on 18/06/24.
//

import SwiftUI

//MARK: - Screen Utils
let _heightRatio : CGFloat = {
    let ratio = _screenSize.height/812
    return ratio
}()

let _widthRatio : CGFloat = {
    let ratio = _screenSize.width/375
    return ratio
}()

let _screenSize     = UIScreen.main.bounds.size
let _screenFrame    = UIScreen.main.bounds

extension Double {
    var w : CGFloat {
        return CGFloat(self) * _widthRatio
    }
    
    var h : CGFloat {
        return CGFloat(self) * _heightRatio
    }
}

//MARK: - Color Extension
extension Color {
    init(hex: String, alpha: Double = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        self.init(
            .sRGB,
            red: Double((rgb & 0xFF0000) >> 16) / 255.0,
            green: Double((rgb & 0x00FF00) >> 8) / 255.0,
            blue: Double(rgb & 0x0000FF) / 255.0,
            opacity: alpha
        )
    }
}

struct CustomShape: Shape {
    var cornerRadius: CGFloat
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)
        )
        return Path(path.cgPath)
    }
}
