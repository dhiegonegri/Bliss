#if canImport(UIKit)
import SwiftUI
import UIKit

// MARK: - SVG path → UIBezierPath (receta del pétalo)

enum LotusSVGPath {
    static func petalLarge() -> UIBezierPath {
        let p = UIBezierPath()
        p.move(to: CGPoint(x: 0, y: 12))
        p.addCurve(to: CGPoint(x: -62, y: -22), controlPoint1: CGPoint(x: -18, y: 10), controlPoint2: CGPoint(x: -42, y: 2))
        p.addCurve(to: CGPoint(x: -114, y: -132), controlPoint1: CGPoint(x: -88, y: -54), controlPoint2: CGPoint(x: -108, y: -92))
        p.addCurve(to: CGPoint(x: -78, y: -236), controlPoint1: CGPoint(x: -118, y: -172), controlPoint2: CGPoint(x: -104, y: -208))
        p.addCurve(to: CGPoint(x: -6, y: -282), controlPoint1: CGPoint(x: -52, y: -262), controlPoint2: CGPoint(x: -24, y: -276))
        p.addCurve(to: CGPoint(x: 0, y: -284), controlPoint1: CGPoint(x: -2, y: -284), controlPoint2: CGPoint(x: 0, y: -284))
        p.addCurve(to: CGPoint(x: 6, y: -282), controlPoint1: CGPoint(x: 2, y: -284), controlPoint2: CGPoint(x: 6, y: -282))
        p.addCurve(to: CGPoint(x: 78, y: -236), controlPoint1: CGPoint(x: 24, y: -276), controlPoint2: CGPoint(x: 52, y: -262))
        p.addCurve(to: CGPoint(x: 114, y: -132), controlPoint1: CGPoint(x: 104, y: -208), controlPoint2: CGPoint(x: 118, y: -172))
        p.addCurve(to: CGPoint(x: 62, y: -22), controlPoint1: CGPoint(x: 108, y: -92), controlPoint2: CGPoint(x: 88, y: -54))
        p.addCurve(to: CGPoint(x: 0, y: 12), controlPoint1: CGPoint(x: 42, y: 2), controlPoint2: CGPoint(x: 18, y: 10))
        p.close()
        return p
    }

    static func petalMedium() -> UIBezierPath {
        let p = UIBezierPath()
        p.move(to: CGPoint(x: 0, y: 10))
        p.addCurve(to: CGPoint(x: -50, y: -20), controlPoint1: CGPoint(x: -14, y: 8), controlPoint2: CGPoint(x: -34, y: 0))
        p.addCurve(to: CGPoint(x: -92, y: -116), controlPoint1: CGPoint(x: -72, y: -48), controlPoint2: CGPoint(x: -88, y: -82))
        p.addCurve(to: CGPoint(x: -64, y: -206), controlPoint1: CGPoint(x: -96, y: -150), controlPoint2: CGPoint(x: -86, y: -182))
        p.addCurve(to: CGPoint(x: -4, y: -246), controlPoint1: CGPoint(x: -42, y: -228), controlPoint2: CGPoint(x: -18, y: -240))
        p.addCurve(to: CGPoint(x: 0, y: -248), controlPoint1: CGPoint(x: -1, y: -248), controlPoint2: CGPoint(x: 0, y: -248))
        p.addCurve(to: CGPoint(x: 4, y: -246), controlPoint1: CGPoint(x: 1, y: -248), controlPoint2: CGPoint(x: 4, y: -246))
        p.addCurve(to: CGPoint(x: 64, y: -206), controlPoint1: CGPoint(x: 18, y: -240), controlPoint2: CGPoint(x: 42, y: -228))
        p.addCurve(to: CGPoint(x: 92, y: -116), controlPoint1: CGPoint(x: 86, y: -182), controlPoint2: CGPoint(x: 96, y: -150))
        p.addCurve(to: CGPoint(x: 50, y: -20), controlPoint1: CGPoint(x: 88, y: -82), controlPoint2: CGPoint(x: 72, y: -48))
        p.addCurve(to: CGPoint(x: 0, y: 10), controlPoint1: CGPoint(x: 34, y: 0), controlPoint2: CGPoint(x: 14, y: 8))
        p.close()
        return p
    }

    static func petalSmall() -> UIBezierPath {
        let p = UIBezierPath()
        p.move(to: CGPoint(x: 0, y: 8))
        p.addCurve(to: CGPoint(x: -34, y: -16), controlPoint1: CGPoint(x: -10, y: 6), controlPoint2: CGPoint(x: -24, y: 0))
        p.addCurve(to: CGPoint(x: -56, y: -90), controlPoint1: CGPoint(x: -48, y: -38), controlPoint2: CGPoint(x: -56, y: -64))
        p.addCurve(to: CGPoint(x: -32, y: -154), controlPoint1: CGPoint(x: -56, y: -116), controlPoint2: CGPoint(x: -46, y: -138))
        p.addCurve(to: CGPoint(x: 0, y: -176), controlPoint1: CGPoint(x: -18, y: -168), controlPoint2: CGPoint(x: -6, y: -174))
        p.addCurve(to: CGPoint(x: 32, y: -154), controlPoint1: CGPoint(x: 6, y: -174), controlPoint2: CGPoint(x: 18, y: -168))
        p.addCurve(to: CGPoint(x: 56, y: -90), controlPoint1: CGPoint(x: 46, y: -138), controlPoint2: CGPoint(x: 56, y: -116))
        p.addCurve(to: CGPoint(x: 34, y: -16), controlPoint1: CGPoint(x: 56, y: -64), controlPoint2: CGPoint(x: 48, y: -38))
        p.addCurve(to: CGPoint(x: 0, y: 8), controlPoint1: CGPoint(x: 24, y: 0), controlPoint2: CGPoint(x: 10, y: 6))
        p.close()
        return p
    }
}

struct LotusPetalSpec: Identifiable {
    enum Size { case large, medium, small }
    let id: String
    let size: Size
    let openDegrees: Double
    let closedDegrees: Double
    let openOffset: CGSize
    let hue: Color
    let stroke: Color

    func bezier() -> UIBezierPath {
        switch size {
        case .large: return LotusSVGPath.petalLarge()
        case .medium: return LotusSVGPath.petalMedium()
        case .small: return LotusSVGPath.petalSmall()
        }
    }

    func degrees(progress: CGFloat) -> Double {
        closedDegrees + (openDegrees - closedDegrees) * Double(progress)
    }

    func offset(progress: CGFloat) -> CGSize {
        CGSize(width: openOffset.width * progress, height: openOffset.height * progress)
    }
}

enum LotusLayout {
    static let petals: [LotusPetalSpec] = [
        .init(id: "L-80", size: .large, openDegrees: -80, closedDegrees: -8, openOffset: CGSize(width: 8, height: 26), hue: Color(red: 1, green: 0.45, blue: 1), stroke: Color(red: 0.88, green: 0.34, blue: 1)),
        .init(id: "R-80", size: .large, openDegrees: 80, closedDegrees: 8, openOffset: CGSize(width: -8, height: 26), hue: Color(red: 0.25, green: 0.85, blue: 1), stroke: Color(red: 0.25, green: 0.85, blue: 1)),
        .init(id: "L-58", size: .large, openDegrees: -58, closedDegrees: -6, openOffset: CGSize(width: 4, height: 12), hue: Color(red: 1, green: 0.38, blue: 0.94), stroke: Color(red: 1, green: 0.38, blue: 0.94)),
        .init(id: "R-58", size: .large, openDegrees: 58, closedDegrees: 6, openOffset: CGSize(width: -4, height: 12), hue: Color(red: 0.24, green: 0.91, blue: 1), stroke: Color(red: 0.24, green: 0.91, blue: 1)),
        .init(id: "L-30", size: .large, openDegrees: -30, closedDegrees: -4, openOffset: CGSize(width: 16, height: 36), hue: Color(red: 1, green: 0.29, blue: 0.88), stroke: Color(red: 1, green: 0.29, blue: 0.88)),
        .init(id: "R-30", size: .large, openDegrees: 30, closedDegrees: 4, openOffset: CGSize(width: -16, height: 36), hue: Color(red: 0.16, green: 0.85, blue: 1), stroke: Color(red: 0.16, green: 0.85, blue: 1)),
        .init(id: "L-44", size: .medium, openDegrees: -44, closedDegrees: -5, openOffset: CGSize(width: 2, height: 0), hue: Color(red: 1, green: 0.47, blue: 1), stroke: Color(red: 1, green: 0.47, blue: 1)),
        .init(id: "R-44", size: .medium, openDegrees: 44, closedDegrees: 5, openOffset: CGSize(width: -2, height: 0), hue: Color(red: 0.4, green: 0.94, blue: 1), stroke: Color(red: 0.4, green: 0.94, blue: 1)),
        .init(id: "L-24", size: .medium, openDegrees: -24, closedDegrees: -3, openOffset: CGSize(width: 0, height: -6), hue: Color(red: 1, green: 0.63, blue: 1), stroke: Color(red: 1, green: 0.63, blue: 1)),
        .init(id: "R-24", size: .medium, openDegrees: 24, closedDegrees: 3, openOffset: CGSize(width: 0, height: -6), hue: Color(red: 0.53, green: 1, blue: 1), stroke: Color(red: 0.53, green: 1, blue: 1)),
        .init(id: "L-13", size: .medium, openDegrees: -13, closedDegrees: -2, openOffset: CGSize(width: 0, height: -14), hue: Color(red: 1, green: 0.72, blue: 1), stroke: Color(red: 1, green: 0.72, blue: 1)),
        .init(id: "R-13", size: .medium, openDegrees: 13, closedDegrees: 2, openOffset: CGSize(width: 0, height: -14), hue: Color(red: 0.72, green: 1, blue: 1), stroke: Color(red: 0.72, green: 1, blue: 1)),
        .init(id: "L-28s", size: .small, openDegrees: -28, closedDegrees: -4, openOffset: CGSize(width: 0, height: -4), hue: Color(red: 1, green: 0.6, blue: 1), stroke: Color(red: 1, green: 0.85, blue: 1)),
        .init(id: "R-28s", size: .small, openDegrees: 28, closedDegrees: 4, openOffset: CGSize(width: 0, height: -4), hue: Color(red: 0.53, green: 1, blue: 1), stroke: Color(red: 0.85, green: 1, blue: 1)),
        .init(id: "L-10s", size: .small, openDegrees: -10, closedDegrees: -2, openOffset: CGSize(width: 0, height: -12), hue: .white, stroke: .white),
        .init(id: "R-10s", size: .small, openDegrees: 10, closedDegrees: 2, openOffset: CGSize(width: 0, height: -12), hue: .white, stroke: .white),
        .init(id: "C0", size: .small, openDegrees: 0, closedDegrees: 0, openOffset: CGSize(width: 0, height: -16), hue: .white, stroke: .white)
    ]
}

struct BezierShape: Shape {
    let bezier: UIBezierPath
    func path(in rect: CGRect) -> Path { Path(bezier.cgPath) }
}

struct LotusBloomView: View {
    var duration: Double = 5
    @State private var progress: CGFloat = 0

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            sparks
            lightBeam
            petals
            core
        }
        .onAppear { play() }
        .onTapGesture { play() }
    }

    private func play() {
        progress = 0
        withAnimation(.easeOut(duration: duration)) { progress = 1 }
    }

    private var petals: some View {
        ZStack {
            ForEach(LotusLayout.petals) { spec in
                let p = spec.bezier()
                let deg = spec.degrees(progress: progress)
                let off = spec.offset(progress: progress)
                let scale = 0.22 + 0.78 * progress
                ZStack {
                    BezierShape(bezier: p).fill(spec.hue.opacity(0.18 + 0.22 * progress)).blur(radius: 10)
                    BezierShape(bezier: p).fill(spec.hue.opacity(0.16))
                    BezierShape(bezier: p).stroke(spec.stroke.opacity(0.55 + 0.4 * progress), lineWidth: 2)
                }
                .frame(width: 280, height: 320)
                .scaleEffect(scale, anchor: .bottom)
                .rotationEffect(.degrees(deg), anchor: .bottom)
                .offset(x: off.width, y: off.height + 70)
            }
        }
    }

    private var lightBeam: some View {
        let rise = -180 * progress
        let bloom = 30 + 140 * progress
        return ZStack {
            Ellipse()
                .fill(RadialGradient(colors: [Color.white.opacity(0.55 * progress), Color.cyan.opacity(0.28 * progress), Color.purple.opacity(0.10 * progress), .clear], center: .center, startRadius: 4, endRadius: bloom))
                .frame(width: bloom * 1.6, height: bloom * 2.4)
                .offset(y: 40 + rise)
                .blur(radius: 18)
            Capsule()
                .fill(LinearGradient(colors: [Color.white.opacity(0), Color.cyan.opacity(0.35 * progress), Color.white.opacity(0.55 * progress), Color.white.opacity(0)], startPoint: .bottom, endPoint: .top))
                .frame(width: 18 + 22 * progress, height: 80 + 220 * progress)
                .offset(y: 20 + rise * 0.7)
                .blur(radius: 10)
        }
        .allowsHitTesting(false)
    }

    private var core: some View {
        let r = 6 + 34 * progress
        return ZStack {
            Circle().fill(Color.white.opacity(0.9)).frame(width: r * 2.8, height: r * 2.8).blur(radius: 16)
            Circle().fill(RadialGradient(colors: [.white, Color.cyan.opacity(0.8), Color.purple.opacity(0)], center: .center, startRadius: 0, endRadius: r * 1.6)).frame(width: r * 2, height: r * 2)
            Circle().fill(.white).frame(width: 8 + 10 * progress, height: 8 + 10 * progress)
        }
        .offset(y: 40 - 30 * progress)
        .opacity(0.35 + 0.65 * progress)
    }

    private var sparks: some View {
        TimelineView(.animation) { timeline in
            Canvas { ctx, size in
                let t = timeline.date.timeIntervalSinceReferenceDate
                for i in 0..<28 {
                    let seed = Double(i) * 17.13
                    let x = size.width * (0.15 + 0.7 * fract(sin(seed) * 43758.23))
                    let y = size.height * (0.12 + 0.76 * fract(sin(seed * 1.7) * 24634.11))
                    let twinkle = 0.35 + 0.65 * abs(sin(t * (1.2 + fract(seed)) + seed))
                    let r = 1.0 + 1.6 * fract(sin(seed * 3) * 91.7)
                    ctx.opacity = twinkle * Double(progress)
                    ctx.fill(Path(ellipseIn: CGRect(x: x, y: y, width: r, height: r)), with: .color(.white))
                }
            }
        }
        .allowsHitTesting(false)
    }

    private func fract(_ x: Double) -> Double { x - floor(x) }
}

#Preview("Loto 5s") {
    LotusBloomView()
        .frame(width: 400, height: 620)
        .preferredColorScheme(.dark)
}
#endif
