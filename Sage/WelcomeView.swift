//
//  WelcomeView.swift
//  SAGEb
//
//  Created by brad.hontz on 3/8/20.
//  Copyright © 2020 brad.hontz. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var settings: UserSettings
    @Binding var goalOfTheDay: String
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0.5) {
                timeOfDayImage().resizable().aspectRatio(contentMode: .fit)
                HStack {
                    Spacer()
                    Text(settings.quoteOfTheDay)
                        .font(.custom("HelveticaNeue-UltraLight", size: 28))
                        .foregroundColor(Color.gray)
                        .frame(maxWidth: 300, minHeight: 120, idealHeight: 120, maxHeight: 170)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(nil)
                        .padding(.trailing)
                }
                HStack {
                    Image("Welcome Plant 1").resizable().frame(width: 290, height: 140, alignment: .leading)
                    Spacer()
                }
                HStack{
                    Text("Today, I will:")
                        .font(.custom("HelveticaNeue-Light", size: 28))
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.leading)
                        .padding(.leading)
                        .frame(width: 170, height: 30).padding(.top, 1)
                    Spacer()
                }
                TextField("Input Goal Here", text: $goalOfTheDay)
                    .font(.custom("HelveticaNeue-UltraLight", size: 27))
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .padding()
                Spacer()
                NavigationLink(destination: HomeView()
                    .navigationBarTitle("")  // for some reason you need a title (ANY title) in order to hide the navigation bar
                    .navigationBarHidden(true)
                ) {
                    Image("Home Button")
                        .resizable()
                        .frame(width: 170, height: 70, alignment: .center)
                        .frame(alignment: .center)
                        .padding(.bottom, 20)
                  }
//                Button(action: {
//                    //action here
//                }){
//                    Image("Home Button").resizable().frame(alignment: .center).frame(width: 170, height: 70, alignment: .center).padding(.bottom, 20)
//                }
//                .buttonStyle(PlainButtonStyle())
            }
        }
    }
    // we vary the greeting image by time of day
    func timeOfDayImage() -> Image {
        let date = Date()
        let calendar = Calendar.current
        let currentHour = calendar.component(.hour, from: date)
        
        switch currentHour {
            case 0..<12:
                return Image("Welcome Morning Header")
            case 12..<17:
                return Image("Welcome Afternoon Header")
            case 17...24:
                return Image("Welcome Evening Header")
            default:
                return Image("Welcome Morning Header")
        }
    }
}

//struct WelcomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        WelcomeView()
//    }
//}

// example of how to make a preview work when the view has an input variable
struct WelcomeView_Previews: PreviewProvider {
    struct BindingTestHolder: View {
        @State var testGoalOfTheDay: String = "preview screen's GOAL OF THE DAY"
        var body: some View {
            WelcomeView(goalOfTheDay: $testGoalOfTheDay)
        }
    }
    static var previews: some View {
        BindingTestHolder()
    }
}
