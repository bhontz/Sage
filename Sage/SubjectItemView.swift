//
//  SubjectItemView.swift
//  Sage
//
//  Created by brad.hontz on 3/12/20.
//  Copyright © 2020 brad.hontz. All rights reserved.
//

import SwiftUI

struct SubjectItemView: View {
    var subject: String = ""
    var daysOfWeek: String = ""
    var duration: Int16
    var hexColor: Int32
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(subject)
                    Spacer()
                    durationHHMMDisplay()
                        .font(.headline)
                }
                Text("S M T W T F S")  // here we "overlay" the user's strikeouts over this pattern
                    .overlay(Text(self.daysOfWeek).bold())
                    .font(.system(.caption, design: .monospaced))  // monospace retains alignment
            }.padding(10)
        }
        .background(Color(UIColor(rgb: Int(self.hexColor))))
    }

    // here we format the duration in minutes to a HH MM readable format
    func durationHHMMDisplay()-> Text {
        var returnText: String = ""
        
        let min = self.duration % 60
        let hr = self.duration / 60

        if self.duration > 0 && min == 0 {
            returnText = "\(hr)hr"
        } else if hr == 0 {
            returnText = "\(min)m"
        } else {
            returnText = "\(hr)hr \(min)m"
        }
        
        return Text(returnText)
    }
}

struct SubjectItemView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectItemView(subject:"Computer Science", daysOfWeek:"S M T W T F S", duration: 190, hexColor: 0x696969)
    }
}
