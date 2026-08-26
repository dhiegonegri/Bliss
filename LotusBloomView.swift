#if canImport(UIKit)
import SwiftUI
import UIKit

// MARK: - SVG path → UIBezierPath (receta del pétalo)

enum LotusSVGPath {
    /// Pétalo grande `#pL` — Bliss.svg
    static func petalLarge() -> UIBezierPath {
        let p = UIBezierPath()
        p.move(to: CGPoint(x: 0, y: 12))
        p.addCurve(to: CGPoint(x: -62, y: -22),
                   controlPoint1: CGPoint(x: -18, y: 10),
                   controlPoint2: CGPoint(x: -42, y: 2))
        p.addCurve(to: CGPoint(x: -114, y: -132),
                   controlPoint1: CGPoint(x: -88, y: -54),
                   controlPoint2: CGPoint(x: -108, y: -92))
        p.addCurve(to: CGPoint(x: -78, y: -236),
                   controlPoint1: CGPoint(x: -118, y: -172),
                   controlPoint2: CGPoint(x: -104, y: -208))
        p.addCurve(to: CGPoint(x: -6, y: -282),
                   controlPoint1: CGPoint(x: -52, y: -262),
                   controlPoint2: CGPoint(x: -24, y: -276))
        p.addCurve(to: CGPoint(x: 0, y: -284),
                   controlPoint1: CGPoint(x: -2, y: -284),
                   controlPoint2: CGPoint(x: 0, y: -284))
        p.addCurve(to: CGPoint(x: 6, y: -282),
                   controlPoint1: CGPoint(x: 2, y: -284),
                   controlPoint2: CGPoint(x: 6, y: -282))
        p.addCurve(to: CGPoint(x: 78, y: -236),
                   controlPoint1: CGPoint(x: 24, y: -276),
                   controlPoint2: CGPoint(x: 52, y: -262))
        p.addCurve(to: CGPoint(x: 114, y: -132),
                   controlPoint1: CGPoint(x: 104, y: -208),
                   controlPoint2: CGPoint(x: 118, y: -172))
        p.addCurve(to: CGPoint(x: 62, y: -22),
                   controlPoint1: CGPoint(x: 108, y: -92),
                   controlPoint2: CGPoint(x: 88, y: -54))
        p.addCurve(to: CGPoint(x: 0, y: 12),
                   controlPoint1: CGPoint(x: 42, y: 2),
                   controlPoint2: CGPoint(x: 18, y: 10))
        p.close()
        return p
    }

    static func petalMedium() -> UIBezierPath {
        let p = UIBezierPath()
        p.move(to: CGPoint(x: 0, y: 10))
        p.addCurve(to: CGPoint(x: -50, y: -20),
                   controlPoint1: CGPoint(x: -14, y: 8),
                   controlPoint2: CGPoint(x: -34, y: 0))
        p.addCurve(to: CGPoint(x: -92, y: -116),
                   controlPoint1: CGPoint(x: -72, y: -48),
                   controlPoint2: CGPoint(x: -88, y: -82))
        p.addCurve(to: CGPoint(x: -64, y: -206),
                   controlPoint1: CGPoint(x: -96, y: -150),
                   controlPoint2: CGPoint(x: -86, y: -182))
        p.addCurve(to: CGPoint(x: -4, y: -246),
                   controlPoint1: CGPoint(x: -42, y: -228),
                   controlPoint2: CGPoint(x: -18, y: -240))
        p.addCurve(to: CGPoint(x: 0, y: -248),
                   controlPoint1: CGPoint(x: -1, y: -248),
                   controlPoint2: CGPoint(x: 0, y: -248))
        p.addCurve(to: CGPoint(x: 4, y: -246),
                   controlPoint1: CGPoint(x: 1, y: -248),
                   controlPoint2: CGPoint(x: 4, y: -246))
        p.addCurve(to: CGPoint(x: 64, y: -206),
                   controlPoint1: CGPoint(x: 18, y: -240),
                   controlPoint2: CGPoint(x: 42, y: -228))
        p.addCurve(to: CGPoint(x: 92, y: -116),
                   controlPoint1: CGPoint(x: 86, y: -182),
                   controlPoint2: CGPoint(x: 96, y: -150))
        p.addCurve(to: CGPoint(x: 50, y: -20),
                   controlPoint1: CGPoint(x: 88, y: -82),
                   controlPoint2: CGPoint(x: 72, y: -48))
        p.addCurve(to: CGPoint(x: 0, y: 10),
                   controlPoint1: CGPoint(x: 34, y: 0),
                   controlPoint2: CGPoint(x: 14, y: 8))
        p.close()
        return p
    }

    static func petalSmall() -> UIBezierPath {
        let p = UIBezierPath()
        p.move(to: CGPoint(x: 0, y: 8))
        p.addCurve(to: CGPoint(x: -34, y: -16),
                   controlPoint1: CGPoint(x: -10, y: 6),
                   controlPoint2: CGPoint(x: -24, y: 0))
        p.addCurve(to: CGPoint(x: -56, y: -90),
                   controlPoint1: CGPoint(x: -48, y: -38),
                   controlPoint2: CGPoint(x: -56, y: -64))
        p.addCurve(to: CGPoint(x: -32, y: -154),
                   controlPoint1: CGPoint(x: -56, y: -116),
                   controlPoint2: CGPoint(x: -46, y: -138))
        p.addCurve(to: CGPoint(x: 0, y: -176),
                   controlPoint1: CGPoint(x: -18, y: -168),
                   controlPoint2: CGPoint(x: -6, y: -174))
        p.addCurve(to: CGPoint(x: 32, y: -154),
                   controlPoint1: CGPoint(x: 6, y: -174),
                   controlPoint2: CGPoint(x: 18, y: -168))
        p.addCurve(to: CGPoint(x: 56, y: -90),
                   controlPoint1: CGPoint(x: 46, y: -138),
                   controlPoint2: CGPoint(x: 56, y: -116))
        p.addCurve(to: CGPoint(x: 34, y: -16),
                   controlPoint1: CGPoint(x: 56, y: -64),
                   controlPoint2: CGPoint(x: 48, y: -38))
        p.addCurve(to: CGPoint(x: 0, y: 8),
                   controlPoint1: CGPoint(x: 24, y: 0),
                   controlPoint2: CGPoint(x: 10, y: 6))
        p.close()
        return p
    }
}
