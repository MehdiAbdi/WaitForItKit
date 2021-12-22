//
//  AddOneByOneCharacterAnimation.swift
//  
//
//  Created by Mehdi on 12/21/21.
//

import SwiftUI

public struct AddOneByOneCharacterAnimation: View {
    @State private var textLabel = ""
    @State var startAnimation = false
    
    public init(text: String) {
        self.text = text
    }
    
    let text:String
    
    public var body: some View {
        HStack {
            Text(textLabel)
                .onAppear {
                    startAnimation.toggle()
                }
            
                .onChange(of: startAnimation) { newValue in
                    if newValue {
                        textLabel = ""
                        textLabel.enumerateCharacters(text: text) { Value in
                            textLabel += Value
                        }
                    }
                }
        }
        .padding()
        .animation(.easeInOut, value: startAnimation)
    }
}

struct TextDescriptionAnimation_Previews: PreviewProvider {
    static var previews: some View {
        AddOneByOneCharacterAnimation(text: "Hello Can")
    }
}
