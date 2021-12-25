//
//  CircleLoadingAnimation.swift
//  Loading-Animation
//
//  Created by Mehdi on 11/11/21.
//

import SwiftUI
import UIKit

public struct CircleLoadingAnimation: View {
    public init(isAnimated: Binding<Bool>, scaleEffect: Binding<Bool>,
                stroke: CGFloat = 10, width: CGFloat = 60, height: CGFloat = 60,
                gradientColorStart: Binding<Color>, gradientColorEnd: Binding<Color>, bgGradient: Color, animationDuration: Double = 1) {
        
        self.width = width
        self.height = height
        self.stroke = stroke
        self.animationDuration = animationDuration
        self.bgColor = bgGradient
        self._isAnimated = isAnimated
        self._scaleEffect = scaleEffect
        self._circleGradientStart = gradientColorStart
        self._circleGradientEnd = gradientColorEnd
    }
    
    var width: CGFloat
    var height: CGFloat
    var stroke: CGFloat
    var animationDuration: Double
    var bgColor: Color
    @Binding var circleGradientStart: Color
    @Binding var circleGradientEnd: Color
    @Binding var isAnimated: Bool
    @Binding var scaleEffect: Bool
    
    private let deviceW = UIScreen.main.bounds.width
    private let deviceH = UIScreen.main.bounds.height
    
    public var body: some View {
        ZStack {
            withAnimation {
                Circle()
                    .stroke(LinearGradient(colors: [circleGradientStart, circleGradientEnd],
                                           startPoint: .top, endPoint: .bottom), lineWidth: stroke)
                    .frame(width: width, height: height)
                    .rotationEffect(.degrees(isAnimated ? 360 : 0))
                    .scaleEffect(scaleEffect ? 1.5 : 1)
                    .animation(.easeInOut(duration: animationDuration).repeatForever(autoreverses: true), value: isAnimated)
            }
        }
        .background(
            ZStack {
                LinearGradient(colors: [bgColor, bgColor], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea(.all)
                    .frame(width: deviceW, height: deviceH)
                    .blur(radius: 220)
                
            }
        )
    }
}
