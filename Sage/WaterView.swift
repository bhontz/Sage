//
//  WaterView.swift
//  SAGEb
//
//  Created by brad.hontz on 3/9/20.
//  Copyright © 2020 brad.hontz. All rights reserved.
//

import SwiftUI

// this structure represents our increasing water cup measurement
enum MeasuredCupEnum: String {
    case img1 = "0MeasuredCups"
    case img2 = "1MeasuredCups"
    case img3 = "2MeasuredCups"
    case img4 = "3MeasuredCups"
//    case img5 = "4MeasuredCups"
//    case img6 = "5MeasuredCups"
//    case img7 = "6MeasuredCups"
//    case img8 = "7Measuredcups"

    func next() -> MeasuredCupEnum {
        switch self {
            case .img1: return .img2
            case .img2: return .img3
            case .img3: return .img4
            case .img4: return .img1
//            case .img5: return .img6
//            case .img6: return .img7
//            case .img7: return .img8
//            case .img8: return .img1
        }
    }
}

// this structure represents our declining CURRENT water cup
enum WaterCupEnum: String {
    case img1 = "8ozWaterCup"
    case img2 = "7ozWaterCup"
    case img3 = "6ozWaterCup"
    case img4 = "5ozWaterCup"
    case img5 = "4ozWaterCup"
    case img6 = "3ozWaterCup"
    case img7 = "2ozWaterCup"
    case img8 = "1ozWaterCup"

    func next() -> WaterCupEnum {
        switch self {
            case .img1: return .img2
            case .img2: return .img3
            case .img3: return .img4
            case .img4: return .img5
            case .img5: return .img6
            case .img6: return .img7
            case .img7: return .img8
            case .img8: return .img1
        }
    }
}

struct WaterView: View {
    @State private var mcimg = MeasuredCupEnum.img1
    @State private var wcimg = WaterCupEnum.img1
    @State private var sipCountDown = 8
    @State private var fadeOut = false

    var body: some View {
        NavigationView {
            VStack{
                Image("Water Header").resizable().frame(width: 300, height: 90, alignment: .center)
                Image(self.mcimg.rawValue).resizable().frame(width: 350, height: 50, alignment: .center)
                Text("x/64 oz").font(.custom("HelveticaNeue-Light", size: 23)).foregroundColor(Color.gray)
                Image("Current Cup Header").resizable().frame(width: 350, height: 50, alignment: .center)
                Image(self.wcimg.rawValue).resizable().frame(width: 300, height: 330, alignment: .center)
                    .opacity(fadeOut ? 0 : 1)
                    .animation(.easeInOut(duration: 0.1))
                    .onTapGesture {
                        self.fadeOut.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            withAnimation {
                                self.sipCountDown -= 1
                                self.wcimg = self.wcimg.next()
                                self.fadeOut.toggle()
                                if self.sipCountDown == 0 {
                                    self.mcimg = self.mcimg.next()
                                    self.sipCountDown = 8
                                }
                            }
                        }
                    }
                
                Spacer()
                NavigationLink(destination: TrackersView()
                    .navigationBarTitle("")  // for some reason you need a title (ANY title) in order to hide the navigation bar
                    .navigationBarHidden(true)
                ){
                    Image("Back Button").renderingMode(.original).resizable().padding([.leading, .bottom]).frame(width: 100, height: 57, alignment: .center)
                }
//                    Button(action: {
//                        //action here
//                    }){
//                        Image("Back Button").resizable().padding([.leading, .bottom]).frame(width: 100, height: 57, alignment: .center)
//                    }
//                    .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct WaterView_Previews: PreviewProvider {
    static var previews: some View {
        WaterView()
    }
}
