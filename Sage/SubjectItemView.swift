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
    var duration:Int16 = 0
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(subject)
                        .font(.headline)
                    Spacer()
                    Text("\(duration)")
                        .font(.headline)
                }
                Text(daysOfWeek)
                .font(.caption)
            }.padding(20)
        }
    }}

struct SubjectItemView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectItemView(subject:"gym", daysOfWeek:"S M T W T F S", duration:30)
    }
}
