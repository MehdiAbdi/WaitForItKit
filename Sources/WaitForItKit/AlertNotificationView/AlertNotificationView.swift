//
//  AlertNotificationView.swift
//  
//
//  Created by Mehdi on 12/22/21.
//

import SwiftUI

public struct AlertNotificationView: View {
    @Binding var imageAnimation: Bool
    @Binding var alertAnimation: Bool
    @Binding var title: String
    
    @State private var hideNotification = false
    private var deviceH = UIScreen.main.bounds.height / 2.2
    
    var imageColor: Color
    var width: CGFloat
    var height: CGFloat
    var notificationBGColor: UIColor
    var fontSize: CGFloat
    
    
    public init(title: Binding<String>, alertAnimation: Binding<Bool>, imageAnimation: Binding<Bool>, fontSize: CGFloat,
                imageColor: Color = .gray, width: CGFloat = 220, height: CGFloat = 50,
                notificationBGColor: UIColor = .notificationBGColor) {
        
        self._title = title
        self._alertAnimation = alertAnimation
        self._imageAnimation = imageAnimation
        self.fontSize = fontSize
        self.imageColor = imageColor
        self.width = width
        self.height = height
        self.notificationBGColor = notificationBGColor
    }
    
    private func alertImage() -> some View {
        return Image(systemName: "xmark.circle.fill")
            .foregroundColor(imageColor)
            .font(.system(size: 25))
            .scaleEffect(imageAnimation ? 1.3 : 1.0)
            .animation(.easeInOut(duration: 0.9), value: imageAnimation)
            .onAppear {
                asyncAnimationToggle()
            }
    }
    
    private func asyncAnimationToggle() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.imageAnimation = false
            self.alertAnimation = false
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation {
                    self.hideNotification.toggle()
                }
            }
        }
    }
    
    public var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(25)
                .foregroundColor(Color(uiColor: notificationBGColor))
            
            HStack(alignment: .center) {
                ZStack {
                    withAnimation {
                        alertImage()
                    }
                }
                
                Spacer()
                Text(title)
                    .font(.system(size: fontSize, weight: .bold, design: .rounded))
                    .foregroundColor(.gray)
                    .padding(.leading, -26)
                
                Spacer()
            }.padding(.leading, 10)
        }
        .frame(width: width, height: height, alignment: .center)
        .animation(.easeInOut(duration: 0.7), value: alertAnimation)
        .offset(x: 0, y: alertAnimation ? -deviceH + 50 : -deviceH)
        .opacity(hideNotification ? 0 : 1)
    }
}


struct AlertNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        AlertNotificationView(title: .constant("Warning"), alertAnimation: .constant(false), imageAnimation: .constant(false), fontSize: 20,
                              imageColor: .gray, width: 220, height: 50, notificationBGColor: .notificationBGColor)
            .preferredColorScheme(.dark)
    }
}