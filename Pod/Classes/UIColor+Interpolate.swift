//
//  UIColor+Interpolate.swift
//  ANLongTapButton
//
//  Created by yyjim on 2021/5/30.
//

import UIKit
import Foundation

// https://stackoverflow.com/questions/22868182/uicolor-transition-based-on-progress-value/35853850#35853850
private struct ColorComponents {
    var r: CGFloat
    var g: CGFloat
    var b: CGFloat
    var a: CGFloat
}

extension UIColor {

    private func getComponents() -> ColorComponents {
        if (cgColor.numberOfComponents == 2) {
            let cc = cgColor.components!
            return ColorComponents(r:cc[0], g:cc[0], b:cc[0], a:cc[1])
        }
        else {
            let cc = cgColor.components!
            return ColorComponents(r:cc[0], g:cc[1], b:cc[2], a:cc[3])
        }
    }

    func interpolateRGBColorTo(end: UIColor, fraction: CGFloat) -> UIColor {
        var f = max(0, fraction)
        f = min(1, fraction)

        let c1 = getComponents()
        let c2 = end.getComponents()

        let r = c1.r + (c2.r - c1.r) * f
        let g = c1.g + (c2.g - c1.g) * f
        let b = c1.b + (c2.b - c1.b) * f
        let a = c1.a + (c2.a - c1.a) * f

        return UIColor(red: r, green: g, blue: b, alpha: a)
    }

}
