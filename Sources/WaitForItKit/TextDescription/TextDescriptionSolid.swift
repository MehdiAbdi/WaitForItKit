//
//  TextDescriptionSolid.swift
//  
//
//  Created by Mehdi on 12/21/21.
//

import SwiftUI

public struct TextDescriptionSolid: View {
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

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TextDescriptionSolid(title: .constant("Hi"), color: .constant(.blue), fontSize: .constant(20), fontWeight: .constant(.semibold), fontDesign: .constant(.rounded))
    }
}
