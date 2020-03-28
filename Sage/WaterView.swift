//
//  ContentView.swift
//  Sage Water Testing 2
//
//  Created by Amber on 3/21/20.
//  Copyright © 2020 Amber. All rights reserved.
//

import SwiftUI

struct WaterView: View {
    @State private var totalOz = 0
    @State private var oz = 8
    @State private var cupNum = 0
    @State private var ozCup = "8ozWaterCup"
    @State private var cupTotal = "0MeasuredCups"
    func nextCup(){
        cupNum = cupNum + 1
        if cupNum == 1{
            cupTotal = "1MeasuredCups"
        }
        if cupNum == 2{
            cupTotal = "2MeasuredCups"
        }
        if cupNum == 3{
            cupTotal = "3MeasuredCups"
        }
        if cupNum == 4{
            cupTotal = "4MeasuredCups"
        }
        if cupNum == 5{
            cupTotal = "5MeasuredCups"
        }
        if cupNum == 6{
            cupTotal = "6MeasuredCups"
        }
        if cupNum == 7{
            cupTotal = "7MeasuredCups"
        }
        if cupNum == 8{
            cupTotal = "8MeasuredCups"
        }
    }
    func nextOz(){
        oz = oz - 1
        totalOz = totalOz + 1
        if oz == 8{
            ozCup = "8ozWaterCup"
        }
        if oz == 7{
            ozCup = "7ozWaterCup"
        }
        if oz == 6{
            ozCup = "6ozWaterCup"
        }
        if oz == 5{
            ozCup = "5ozWaterCup"
        }
        if oz == 4{
            ozCup = "4ozWaterCup"
        }
        if oz == 3{
            ozCup = "3ozWaterCup"
        }
        if oz == 2{
            ozCup = "2ozWaterCup"
        }
        if oz == 1{
            ozCup = "1ozWaterCup"
        }
        if oz == 0{
            ozCup = "1ozWaterCup"
            nextCup()
            oz = 8
            ozCup = "8ozWaterCup"
        }
    }
    var body: some View {
        VStack {
            Image("Water Header").resizable().frame(width: 300, height: 90, alignment: .center)
            Image(cupTotal).resizable().frame(width: 350, height: 50, alignment: .center)
            Text("\(totalOz)/64 oz").font(.custom("HelveticaNeue-Light", size: 23)).foregroundColor(Color.gray)
            Image("Current Cup Header").resizable().frame(width: 350, height: 50, alignment: .center)
            Image(ozCup).resizable().frame(width: 300, height: 330, alignment: .center)
            HStack{
                Button(action: {
                    //action here
                }){
                    Image("Back Button").resizable().padding([.leading, .bottom]).frame(width: 100, height: 57, alignment: .center)
                }
                .buttonStyle(PlainButtonStyle())
                Spacer()
                Button(action: {
                    self.nextOz()
                }){
                    Image("Minus 10 oz").resizable().padding([.bottom, .trailing]).frame(width: 100, height: 70, alignment: .center)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct WaterView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
