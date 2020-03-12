//
//  StudySubjectDetailView.swift
//  Sage
//
//  Created by brad.hontz on 3/12/20.
//  Copyright © 2020 brad.hontz. All rights reserved.
//

import SwiftUI

struct StudySubjectDetailView: View {
    @Binding var showDetail: Bool
    @State private var timeIncrement = 30
    
    var body: some View {
        VStack {
            Text("This is the detailed view")
            Spacer()
            studyTimeStepper()
            Spacer()
            Button("Dismiss") {
                self.showDetail.toggle()
            }
        }
    }
    func studyTimeStepper() -> some View {
        Stepper(onIncrement: {
            self.timeIncrement += 30
        }, onDecrement: {
            if self.timeIncrement >= 30 {
                self.timeIncrement -= 30
            }
        }) {
            Text("Increment Study Time: \(timeIncrement)")
        }.padding()
    }
}

struct StudySubjectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StudySubjectDetailView(showDetail: .constant(true))
    }
}
