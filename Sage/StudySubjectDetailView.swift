//
//  StudySubjectDetailView.swift
//  Sage
//
//  Created by brad.hontz on 3/12/20.
//  Copyright © 2020 brad.hontz. All rights reserved.
//

import SwiftUI

struct StudySubjectDetailView: View {
    @ObservedObject var subItem: SubjectItem
    private let strikeChar: String = "X" // this is the character we use for DayOfWeek strikeout
    private let timeIncrement: Int16 = 10  // bump study time in 10m increments
    
    var body: some View {
        VStack {
            Text(subItem.subject)
            Spacer()
            HStack(spacing: 25.0) {
                Button(action: {
                    self.strikeDayOfWeek(idx: 0)
                }) {
                    Text(displayDayOfWeek(idx: 0) ? "S" : self.strikeChar)
                }
                Button(action: {
                    self.strikeDayOfWeek(idx: 2)
                }) {
                    Text(displayDayOfWeek(idx: 2) ? "M" : self.strikeChar)
                }
                Button(action: {
                    self.strikeDayOfWeek(idx: 4)
                }) {
                    Text(displayDayOfWeek(idx: 4) ? "T" : self.strikeChar)
                }
                Button(action: {
                    self.strikeDayOfWeek(idx: 6)
                }) {
                    Text(displayDayOfWeek(idx: 6) ? "W" : self.strikeChar)
                }
                Button(action: {
                    self.strikeDayOfWeek(idx: 8)
                }) {
                    Text(displayDayOfWeek(idx: 8) ? "T" : self.strikeChar)
                }
                Button(action: {
                    self.strikeDayOfWeek(idx: 10)
                }) {
                    Text(displayDayOfWeek(idx: 10) ? "F" : self.strikeChar)
                }
                Button(action: {
                    self.strikeDayOfWeek(idx: 12)
                }) {
                    Text(displayDayOfWeek(idx: 12) ? "S" : self.strikeChar)
                }

            }
            Spacer()
            studyTimeStepper()
            Spacer()
        }
    }
    func studyTimeStepper() -> some View {
        Stepper(onIncrement: {
            self.subItem.duration += self.timeIncrement   // was self.timeIncrement
        }, onDecrement: {
            if self.subItem.duration >= self.timeIncrement {
                self.subItem.duration -= self.timeIncrement
            }
        }) {
            Text("Increment Study Time: \(self.subItem.duration)")
        }.padding()
    }
    
    func strikeDayOfWeek(idx: Int) {
        let baseState: [Character] = Array("S M T W T F S")
        let currentState: [Character] = Array(self.subItem.daysOfWeek)
        var newState: [Character] = [Character]()
        
        for i in 0 ... currentState.count - 1 {
            if i == idx && currentState[i] == Character(self.strikeChar) {
                newState.append(baseState[i])
            } else if i == idx {
                newState.append(Character(self.strikeChar))
            } else {
                newState.append(currentState[i])
            }
        }
        
        self.subItem.daysOfWeek = String(newState)
        
    }
    
    func displayDayOfWeek(idx: Int) -> Bool {
        var returnState: Bool = true
        let index = self.subItem.daysOfWeek.index(self.subItem.daysOfWeek.startIndex, offsetBy: idx)
        
        if self.subItem.daysOfWeek[index] == Character(self.strikeChar) {
            returnState = false
        }
        
        return returnState
    }
}

//struct StudySubjectDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        StudySubjectDetailView(showDetail: .constant(true))
//    }
//}
