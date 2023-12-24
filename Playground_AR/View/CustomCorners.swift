//
//  CustomCorners.swift
//  Playground_AR
//
//  Created by Settawat Buddhakanchana on 18/11/2566 BE.
//

import SwiftUI

struct CustomCorners: Shape {
    
    var corners: UIRectCorner
    var radius : CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii:
                                    CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)

    }
}
