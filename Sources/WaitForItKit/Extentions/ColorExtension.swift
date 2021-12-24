//
//  ColorExtension.swift
//  
//
//  Created by Mehdi on 12/22/21.
//

import SwiftUI

public extension UIColor {
    static var notificationBGColor: UIColor = {
        UIColor(named: "NotificationColorSystemAppearence", in: .module, compatibleWith: nil)!
    }()
}
