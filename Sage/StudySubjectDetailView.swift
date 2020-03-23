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
    private let timeIncrement: Int16 = 10  // increment amount for study time
    
    var body: some View {
        VStack {
            Text(subItem.subject)
                .font(.title)
                .foregroundColor(Color(UIColor(rgb: Int(self.subItem.hexColor))))
            Spacer()
            Text("Select \(subItem.subject)'s color:")
            HStack(spacing: 10.0) {
                Button(action: {
                    self.subItem.hexColor = fillColors[0]  // see StudyScheduleView
                }){
                    Rectangle()
                        .fill(Color(UIColor(rgb: Int(fillColors[0]))))
                        .frame(width: 20, height: 20)
                }
                Button(action: {
                    self.subItem.hexColor = fillColors[1]
                }){
                    Rectangle()
                        .fill(Color(UIColor(rgb: Int(fillColors[1]))))
                        .frame(width: 20, height: 20)
                }
                Button(action: {
                    self.subItem.hexColor = fillColors[2]
                }){
                    Rectangle()
                        .fill(Color(UIColor(rgb: Int(fillColors[2]))))
                        .frame(width: 20, height: 20)
                }
                Button(action: {
                    self.subItem.hexColor = fillColors[3]
                }){
                    Rectangle()
                        .fill(Color(UIColor(rgb: Int(fillColors[3]))))
                        .frame(width: 20, height: 20)
                }
                Button(action: {
                    self.subItem.hexColor = fillColors[4]
                }){
                    Rectangle()
                        .fill(Color(UIColor(rgb: Int(fillColors[4]))))
                        .frame(width: 20, height: 20)
                }
                Button(action: {
                    self.subItem.hexColor = fillColors[5]
                }){
                    Rectangle()
                        .fill(Color(UIColor(rgb: Int(fillColors[5]))))
                        .frame(width: 20, height: 20)
                }
                Button(action: {
                    self.subItem.hexColor = fillColors[6]
                }){
                    Rectangle()
                        .fill(Color(UIColor(rgb: Int(fillColors[6]))))
                        .frame(width: 20, height: 20)
                }
                Button(action: {
                    self.subItem.hexColor = fillColors[7]
                }){
                    Rectangle()
                        .fill(Color(UIColor(rgb: Int(fillColors[7]))))
                        .frame(width: 20, height: 20)
                }
                Button(action: {
                    self.subItem.hexColor = fillColors[8]
                }){
                    Rectangle()
                        .fill(Color(UIColor(rgb: Int(fillColors[8]))))
                        .frame(width: 20, height: 20)
                }
                Button(action: {
                    self.subItem.hexColor = fillColors[9]
                }){
                    Rectangle()
                        .fill(Color(UIColor(rgb: Int(fillColors[9]))))
                        .frame(width: 20, height: 20)
                }
            }
            Spacer()
            Text("Select days of the week to study \(subItem.subject):")
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
            NavigationLink(destination: StudyScheduleView()
                .navigationBarTitle("")  // for some reason you need a title (ANY title) in order to hide the navigation bar
                .navigationBarHidden(true)
            ) {
                Text("Return")
            }
            
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
            Text("Daily minutes to study \(self.subItem.subject): \(self.subItem.duration)")
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
