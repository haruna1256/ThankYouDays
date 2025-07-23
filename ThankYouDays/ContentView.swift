//
//  ContentView.swift
//  ThankYouDays
//
//  Created by 川岸遥奈 on 2025/07/22.
//
import SwiftUI

struct ContentView: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height

    var body: some View {
        ZStack {
            Color.backgroundIvory
                .ignoresSafeArea()

            VStack {
                Spacer()
                Image("box")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .opacity(0.85)
                    .colorMultiply(Color.backgroundIvory.opacity(0.9))
                    .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 5)
                    .padding(.bottom, 30)
            }

            BalloonFieldView(boxTopY: screenHeight - 250 - 30)
                .ignoresSafeArea()

            VStack {
                Spacer()
                Button {
                    print("追加ボタンが押された")
                } label: {
                    Text("Thanks Box")
                        .foregroundColor(Color.textDarkGray)
                        .font(.title2)
                        .padding()
                }
            }
        }
    }
}

struct BalloonView: View {
    let color: Color
    let text: String

    let initialX: CGFloat
    let initialY: CGFloat

    let size: CGSize

    let floatDistance: CGFloat
    let floatDuration: Double

    let xWobbleAmount: CGFloat
    let wobbleDuration: Double

    @State private var currentPosition: CGPoint
    @State private var wobble = false

    // ランダム光沢のための構造体
    struct Gloss: Identifiable {
        let id = UUID()
        let offsetX: CGFloat
        let offsetY: CGFloat
        let widthRatio: CGFloat
        let heightRatio: CGFloat
        let opacity: Double
    }

    let glosses: [Gloss]

    init(color: Color, text: String, initialX: CGFloat, initialY: CGFloat) {
        self.color = color
        self.text = text
        self.initialX = initialX
        self.initialY = initialY

        let width = CGFloat.random(in: 60...100)
        self.size = CGSize(width: width, height: width * 1.1)

        self.floatDistance = CGFloat.random(in: 500...700)
        self.floatDuration = Double.random(in: 30...50)

        self.xWobbleAmount = CGFloat.random(in: 15...30)
        self.wobbleDuration = Double.random(in: 3...6)

        // ランダムな光沢を3つ作成
        self.glosses = (0..<3).map { _ in
            Gloss(
                offsetX: CGFloat.random(in: 0.1...0.3),
                offsetY: CGFloat.random(in: 0.1...0.4),
                widthRatio: CGFloat.random(in: 0.08...0.15),
                heightRatio: CGFloat.random(in: 0.08...0.15),
                opacity: Double.random(in: 0.5...0.85)
            )
        }

        _currentPosition = State(initialValue: CGPoint(x: initialX, y: initialY))
    }

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Ellipse()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [color.opacity(1.0), color.opacity(0.85)]),
                            center: .topLeading,
                            startRadius: 5,
                            endRadius: size.width
                        )
                    )
                    .frame(width: size.width, height: size.height)
                    .shadow(color: color.opacity(0.4), radius: 8, x: 0, y: 4)

                // 新しい光沢表現（縁のカーブに沿った白い点）
                Group {
                    Ellipse()
                        .fill(Color.white.opacity(0.7))
                        .frame(width: size.width * 0.08, height: size.height * 0.10)
                        .offset(x: -size.width * 0.35, y: -size.height * 0.25)

                    Ellipse()
                        .fill(Color.white.opacity(0.5))
                        .frame(width: size.width * 0.12, height: size.height * 0.10)
                        .offset(x: -size.width * 0.22, y: -size.height * 0.35)

                    Ellipse()
                        .fill(Color.white.opacity(0.4))
                        .frame(width: size.width * 0.10, height: size.height * 0.12)
                        .offset(x: -size.width * 0.08, y: -size.height * 0.40)
                }

                Text(text)
                    .font(.caption2)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(width: size.width * 0.8)
                    .offset(y: size.height * 0.3)
            }

            // ヒモ
            Path { path in
                path.move(to: .zero)
                path.addQuadCurve(to: CGPoint(x: 0, y: size.height * 0.45),
                                  control: CGPoint(x: size.width * 0.1, y: size.height * 0.25))
            }
            .stroke(color.opacity(0.85), lineWidth: size.width * 0.025)
            .frame(width: size.width * 0.25, height: size.height * 0.45)
        }
        .position(currentPosition)
        .rotationEffect(.degrees(wobble ? 3 : -3))
        .onAppear {
            withAnimation(.linear(duration: floatDuration).repeatForever(autoreverses: false)) {
                currentPosition.y -= floatDistance
            }
            withAnimation(.easeInOut(duration: wobbleDuration).repeatForever(autoreverses: true)) {
                currentPosition.x += xWobbleAmount
            }
            withAnimation(.easeInOut(duration: wobbleDuration / 2).repeatForever(autoreverses: true)) {
                wobble.toggle()
            }
        }
    }
}

struct Balloon: Identifiable {
    let id = UUID()
    let color: Color
    let text: String
}

struct BalloonFieldView: View {
    let balloons: [Balloon] = [
        Balloon(color: Color(red: 1.0, green: 0.48, blue: 0.2), text: "ありがとう！"),
        Balloon(color: Color(red: 0.25, green: 0.70, blue: 0.85), text: "感謝です"),
        Balloon(color: Color(red: 1.0, green: 0.65, blue: 0.4), text: "助かった"),
        Balloon(color: Color(red: 0.65, green: 0.5, blue: 0.9), text: "嬉しい！"),
        Balloon(color: Color(red: 0.3, green: 0.65, blue: 0.9), text: "最高！"),
        Balloon(color: Color(red: 1.0, green: 0.75, blue: 0.3), text: "ありがとう！"),
        Balloon(color: Color(red: 1.0, green: 0.48, blue: 0.45), text: "感謝！"),
        Balloon(color: Color(red: 0.45, green: 0.85, blue: 0.5), text: "ありがとう！"),
        Balloon(color: Color(red: 0.25, green: 0.70, blue: 0.85), text: "感謝です"),
        Balloon(color: Color(red: 0.65, green: 0.5, blue: 0.9), text: "ありがとう！")
    ]

    let boxTopY: CGFloat

    var body: some View {
        GeometryReader { geo in
            ZStack {
                ForEach(balloons) { balloon in
                    let initialX = CGFloat.random(in: 40...(geo.size.width - 40))
                    BalloonView(
                        color: balloon.color,
                        text: balloon.text,
                        initialX: initialX,
                        initialY: boxTopY
                    )
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
