//
//  UIColor+Hex.swift
//  Sage
//
//  Created by brad.hontz on 3/19/20.
//  Copyright © 2020 brad.hontz. All rights reserved.
//
//  SOURCE: https://www.zerotoappstore.com/how-to-set-background-color-in-swift.html
//
// this module allows you to set colors using an HTML like int (e.g. 0x696969 = dark gray)
//
import SwiftUI
import Foundation

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
