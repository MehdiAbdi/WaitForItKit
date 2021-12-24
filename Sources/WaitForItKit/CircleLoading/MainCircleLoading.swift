//
//  MainCircleLoading.swift
//  
//
//  Created by Mehdi on 12/21/21.
//

import SwiftUI

fileprivate struct MainCircleLoading: View {
    @Binding var startAnimation: Bool
    @Binding var scaleEffect: Bool
    @State var font: CGFloat = 20
    
    var body: some View {
        VStack {
            CircleLoadingAnimation(isAnimated: $startAnimation, scaleEffect: $scaleEffect, stroke: .constant(20), width: .constant(100), height: .constant(100), gradientColorStart: .constant(.red), gradientColorEnd: .constant(.blue), bgGradientStart: .constant(.red) , bgGradientEnd: .constant(.red),animationDuration: .constant(1))
                .padding()
            
            TextDescriptionSolid(title: .constant("Hi"), color: .constant(.blue), fontSize: .constant(20), fontWeight: .constant(.semibold), fontDesign: .constant(.rounded))
        }
    }
}

struct CircleLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        MainCircleLoading(startAnimation: .constant(true), scaleEffect: .constant(true))
    }
}
