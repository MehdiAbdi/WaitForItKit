//
//  GradientCircleLoadingView.swift
//  Loading-Animation
//
//  Created by Mehdi on 11/11/21.
//

import SwiftUI
import UIKit

fileprivate struct GradientCircleLoadingView: View {
    @Binding var startAnimation: Bool
    @Binding var scaleEffect: Bool
    @State var font: CGFloat = 20
    
    var body: some View {
        VStack {
            CircleLoadingAnimation(isAnimated: $startAnimation, scaleEffect: $scaleEffect, stroke: .constant(20), width: .constant(100), height: .constant(100), gradientColorStart: .constant(.red), gradientColorEnd: .constant(.blue), bgGradientStart: .constant(.red) , bgGradientEnd: .constant(.red),animationDuration: .constant(1))
                .padding()
            
            TextDescriptionAnimation(title: .constant("Hi"), color: .constant(.blue), fontSize: .constant(20), fontWeight: .constant(.semibold), fontDesign: .constant(.rounded))
        }
    }
}

public struct CircleLoadingAnimation: View {
    public init(isAnimated: Binding<Bool>, scaleEffect: Binding<Bool>,
                stroke: Binding<CGFloat>, width: Binding<CGFloat>, height: Binding<CGFloat>,
                gradientColorStart: Binding<Color>, gradientColorEnd: Binding<Color>, bgGradientStart: Binding<Color>,
                bgGradientEnd: Binding<Color>, animationDuration: Binding<Double>) {
        
        self._isAnimated = isAnimated
        self._scaleEffect = scaleEffect
        
        self._stroke = stroke
        self._width = width
        self._height = height
        self._circleGradientStart = gradientColorStart
        self._circleGradientEnd = gradientColorEnd
        self._bgGradientStart = bgGradientStart
        self._bgGradientEnd = bgGradientEnd
        self._animationDuration = animationDuration
    }
    
    @Binding var stroke: CGFloat
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    @Binding var circleGradientStart: Color
    @Binding var circleGradientEnd: Color
    @Binding var bgGradientStart: Color
    @Binding var bgGradientEnd: Color
    @Binding var animationDuration: Double
    
    @Binding var isAnimated: Bool
    @Binding var scaleEffect: Bool
    
    let deviceW = UIScreen.main.bounds.width
    let deviceH = UIScreen.main.bounds.height
    
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
        }.background {
            LinearGradient(colors: [bgGradientStart, bgGradientEnd], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(.all)
                .frame(width: deviceW, height: deviceH)
                .blur(radius: 200)
        }
    }
}

public struct TextDescriptionAnimation: View {
    public init(title: Binding<String>, color: Binding<Color>, fontSize: Binding<CGFloat>,
                fontWeight: Binding<Font.Weight>, fontDesign: Binding<Font.Design>) {
        
        self._title = title
        self._fontSize = fontSize
        self._color = color
        self._fontWight = fontWeight
        self._fontDesign = fontDesign
    }
    
    @Binding var title: String
    @Binding var fontSize: CGFloat
    @Binding var color: Color
    @Binding var fontWight: Font.Weight
    @Binding var fontDesign: Font.Design
    
    public var body: some View {
        Text(title)
            .font(.system(size: fontSize, weight: fontWight, design: fontDesign))
            .foregroundColor(color)
    }
}


fileprivate struct CircleLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        GradientCircleLoadingView(startAnimation: .constant(true), scaleEffect: .constant(true))
    }
}
