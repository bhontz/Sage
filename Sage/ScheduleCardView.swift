//
//  ScheduleCardView.swift
//  Sage
//
//  Created by brad.hontz on 3/19/20.
//  Copyright © 2020 brad.hontz. All rights reserved.
//

import SwiftUI

struct Card: Hashable {
    let id: UUID = UUID()
    let prompt: String
    let answer: String

    static var example: Card {
        Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct ScheduleCardView: View {
    var card: Card
    @State private var isShowingAnswer = false
    @State private var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
                .shadow(radius: 10)

            VStack {
                Text("y: \(self.viewState.height)").font(.caption)
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                if self.isShowingAnswer {
                    Text(card.answer)
                        .font(.title)
                        .foregroundColor(.gray)
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 350, height: 200)
        .onTapGesture {
            self.isShowingAnswer.toggle()
        }
        .offset(y: self.viewState.height)
        .gesture(
            //DragGesture(minimumDistance: 30, coordinateSpace: .local)
            DragGesture()
            .onChanged{ value in
                self.viewState = value.translation
            }
            .onEnded{ value in
                self.viewState = CGSize.zero
            }
        )
        
    }
}

struct ScheduleCardView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleCardView(card: Card.example)
    }
}
