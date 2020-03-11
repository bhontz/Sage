//
//  TrackersView.swift
//  SAGEb
//
//  Created by brad.hontz on 3/9/20.
//  Copyright © 2020 brad.hontz. All rights reserved.
//

import SwiftUI

struct TrackersView: View {
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Trackers Header").resizable().frame(width: 300, height: 75, alignment: .center).padding(.top, 10)
                Button(action: {
                    //action here
                }){
                    Image("Trackers Sleep Button").resizable().frame(alignment: .center).aspectRatio(contentMode: .fit)
                }
                .buttonStyle(PlainButtonStyle())
                NavigationLink(destination: WaterView()
                    .navigationBarTitle("")  // for some reason you need a title (ANY title) in order to hide the navigation bar
                    .navigationBarHidden(true)
                ){
                    Image("Trackers Water Button").renderingMode(.original).resizable().frame(alignment: .center).aspectRatio(contentMode: .fit)
                }
//                Button(action: {
//                    //action here
//                }){
//                    Image("Trackers Water Button").resizable().frame(alignment: .center).aspectRatio(contentMode: .fit)
//                }
                .buttonStyle(PlainButtonStyle())
                Button(action: {
                    //action here
                }){
                    Image("Trackers Book Button").resizable().frame(alignment: .center).aspectRatio(contentMode: .fit)
                }
                .buttonStyle(PlainButtonStyle())
                HStack {
                    NavigationLink(destination: HomeView()
                        .navigationBarTitle("")  // for some reason you need a title (ANY title) in order to hide the navigation bar
                        .navigationBarHidden(true)
                    ){
                        Image("Back Button").renderingMode(.original).resizable().padding(.leading, 30.0).padding(.top, 10.0).frame(width: 140, height: 60)
                    }
//                    Button(action: {
//                        //action here
//                    }){
//                        Image("Back Button").resizable().padding(.leading, 30.0).padding(.top, 10.0).frame(width: 140, height: 60)
//                    }
//                    .buttonStyle(PlainButtonStyle())
                    Spacer()
                }
                Spacer()

            }            
        }
    }
}

struct TrackersView_Previews: PreviewProvider {
    static var previews: some View {
        TrackersView()
    }
}
