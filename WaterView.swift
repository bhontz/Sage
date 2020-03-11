//
//  WaterView.swift
//  SAGEb
//
//  Created by brad.hontz on 3/9/20.
//  Copyright © 2020 brad.hontz. All rights reserved.
//

import SwiftUI

struct WaterView: View {
    
    var body: some View {
        NavigationView {
            VStack{
                Image("Water Header").resizable().frame(width: 300, height: 90, alignment: .center)
                Image("Water Cups Measurement").resizable().frame(width: 350, height: 50, alignment: .center)
                Text("x/64 oz").font(.custom("HelveticaNeue-Light", size: 23)).foregroundColor(Color.gray)
                Image("Current Cup Header").resizable().frame(width: 350, height: 50, alignment: .center)
                Image("Water Cup").resizable().frame(width: 300, height: 330, alignment: .center)
                HStack{
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
                    Spacer()
                    Button(action: {
                        //action here
                    }){
                        Image("Minus 10 oz").resizable().padding([.bottom, .trailing]).frame(width: 100, height: 70, alignment: .center)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

struct WaterView_Previews: PreviewProvider {
    static var previews: some View {
        WaterView()
    }
}
