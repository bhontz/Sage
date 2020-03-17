//
//  SubjectItemView.swift
//  Sage
//
//  Created by brad.hontz on 3/12/20.
//  Copyright © 2020 brad.hontz. All rights reserved.
//

import SwiftUI

struct SubjectItemView: View {
    var subject:String = ""
    var daysOfWeek:String = ""
    var duration: Int16
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(subject)
                    Spacer()
                    Text("\(duration)")
                        .font(.headline)
                }
                Text("S M T W T F S")
                    .overlay(provideOverlay())
                    .font(.system(.caption, design: .monospaced))
            }.padding(10)
        }
    }
    func provideOverlay()-> Text {
        return Text("  X     X   X").bold()
    }
}


struct SubjectItemView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectItemView(subject:"gym", daysOfWeek:"S M T W T F S", duration:30)
    }
}
