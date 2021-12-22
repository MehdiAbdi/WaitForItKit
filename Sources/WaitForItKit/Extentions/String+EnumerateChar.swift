//
//  File.swift
//  
//
//  Created by Mehdi on 12/21/21.
//

import Foundation

extension String {
    func enumerateCharacters(text: String, completionHandler: @escaping (String) -> ()) {
        var charText = String()
        text.enumerated().forEach { index, character in
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.1) {
                charText += String(character)
                completionHandler(String(character))
            }
        }
    }
}
