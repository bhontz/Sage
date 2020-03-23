//
//  DailyScheduleView.swift
//  Sage
//
//  Created by brad.hontz on 3/19/20.
//  Copyright © 2020 brad.hontz. All rights reserved.
//

import SwiftUI


struct DailyScheduleView: View {
    //@State private var cards = [Card](repeating: Card.example, count: 10)
    @State private var cards: [Card] = [Card(prompt: "Physics", answer: "01"), Card(prompt:"Calculus", answer: "02"), Card(prompt:"Literature", answer: "03"),Card(prompt:"Computer Science", answer: "04"),Card(prompt:"Spanish", answer: "05"),Card(prompt:"Biology", answer: "06")]
    @State private var viewState = CGSize.zero
    
    var body: some View {
        VStack {
            NavigationLink(destination: StudyScheduleView()
                .navigationBarTitle("")  // for some reason you need a title (ANY title) in order to hide the navigation bar
                .navigationBarHidden(true)
            ) {
                Text("Class Subjects Setup")
            }
            Spacer()
            ScrollView(.vertical, showsIndicators: true) {
                ForEach(self.cards, id: \.self) {
                    theCard in
                    ScheduleCardView(card: theCard)
                }
            }
            Spacer()
            NavigationLink(destination: HomeView()
                .navigationBarTitle("")  // for some reason you need a title (ANY title) in order to hide the navigation bar
                .navigationBarHidden(true)
            ) {
                Text("Back Home")
            }
        }
    }
//        ZStack {
//            VStack {
//                ZStack {
//                    ForEach(0..<cards.count, id: \.self) { index in
//                        ScheduleCardView(card: self.cards[index])
//                            .stacked(at: index, in: self.cards.count)
//                    }
//                }
//            }
//        }
//    }
}
//extension View {
//    func stacked(at position: Int, in total: Int) -> some View {
//        let offset = CGFloat(total - position)
//        return self.offset(CGSize(width: 0, height: offset * 40))
//    }
//}

struct DailyScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        DailyScheduleView()
    }
}
