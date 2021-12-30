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
    @Binding var slideAnimation: Bool
    @Binding var title: String
    
    private var deviceH = UIScreen.main.bounds.height
    
    var imageColor: Color
    var width: CGFloat
    var height: CGFloat
    var notificationBGColor: UIColor
    var fontSize: CGFloat
    var alertSystemImage: String?
    
    public init(title: Binding<String>, alertAnimation: Binding<Bool>, imageAnimation: Binding<Bool>,
                slideAnimation: Binding<Bool>, alertSystemImage: String?, fontSize: CGFloat = 15,
                imageColor: Color = .gray, width: CGFloat = 220, height: CGFloat = 50,
                notificationBGColor: UIColor = .notificationBGColor) {
        
        self._title = title
        self._alertAnimation = alertAnimation
        self._imageAnimation = imageAnimation
        self._slideAnimation = slideAnimation
        self.alertSystemImage = alertSystemImage
        self.fontSize = fontSize
        self.imageColor = imageColor
        self.width = width
        self.height = height
        self.notificationBGColor = notificationBGColor
    }
    
    private func alertImage() -> some View {
        
        return Image(systemName: alertSystemImage ?? "")
            .foregroundColor(imageColor)
            .font(.system(size: 25))
            .scaleEffect(imageAnimation ? 1.3 : 0.8)
            .animation(.easeInOut(duration: 1), value: imageAnimation)
    }
    
    private func asyncAnimationToggle() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.slideAnimation = false
            self.imageAnimation = false
            self.alertAnimation = false
        }
    }
    
    public var body: some View {
        ZStack {
            withAnimation {
                
                ZStack {
                    Rectangle()
                        .cornerRadius(25)
                        .foregroundColor(Color(UIColor.init(named: "NotificationColorSystemAppearence",
                                                            in: .module, compatibleWith: nil)!))
                    
                    HStack(alignment: .center) {
                        ZStack {
                            if alertSystemImage != nil {
                                withAnimation {
                                    alertImage()
                                }
                            }
                        }
                        
                        Spacer()
                        HStack {
                            Text(title)
                                .fixedSize()
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                .font(.system(size: fontSize, weight: .bold, design: .rounded))
                                .foregroundColor(.gray)
                                .padding(.leading, -26)
                        }
                        .padding()
                        .padding(.leading, 7)
                        Spacer()
                    }.padding(.leading, 10)
                    
                }
                .frame(width: width, height: height, alignment: .center)
                .offset(x: 0, y: slideAnimation ? (-deviceH / 2.2) + 40  : -deviceH / 1.5)
                .animation(.easeInOut(duration: 0.7), value: alertAnimation)
            }
            
        }.onChange(of: slideAnimation) { newValue in
            asyncAnimationToggle()
        }
    }
}


struct AlertNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        AlertNotificationView(title: .constant("Something went wrong"), alertAnimation: .constant(false),
                              imageAnimation: .constant(false), slideAnimation: .constant(false), alertSystemImage: "xmark.circle.fill", fontSize: 15,
                              imageColor: .gray, width: 220, height: 50, notificationBGColor: .notificationBGColor)
            .preferredColorScheme(.dark)
    }
}

