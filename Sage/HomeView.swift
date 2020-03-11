//
//  HomeView.swift
//  SAGEb
//
//  Created by brad.hontz on 3/9/20.
//  Copyright © 2020 brad.hontz. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0.5) {
                HStack {
                    Text("Today I will ...")
                    //.font(.title)
                    .font(.custom("HelveticaNeue-Light", size: 32))
                    .padding(.horizontal, 40.0)
                    Spacer()
                }
                Text(settings.goalOfTheDay)
                    //.font(.title)
                    .font(.custom("HelveticaNeue-Light", size: 24))
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .padding(.horizontal, 30.0)
                Spacer()
                HStack {
                    NavigationLink(destination: ToDoView()
                        .navigationBarTitle("")  // for some reason you need a title (ANY title) in order to hide the navigation bar
                        .navigationBarHidden(true)
                    ) {
                        Image("Home To-Do Button")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 175, height: 70, alignment: .leading)
                            .padding(.horizontal, 20.0)
                    }
                    Spacer()
                    Image("Home Plant 1")
                        .resizable()
                        .frame(width: 200, height: 100, alignment: .leading)
                }
                Spacer()
                ZStack {
                    HStack {
                        Image("Home Plant 2")
                            .resizable()
                            .frame(width: 300, height: 170, alignment: .leading)
                            .padding(.horizontal, 20.0)
                            Spacer()
                    }
                    HStack {
                        Image("Home Schedule Button")
                            .resizable()
                            .frame(width: 185, height: 80, alignment: .leading)
                            .padding(.horizontal, 20.0)
                        Spacer()
                        Image("Home Stress Relief Button")
                            .resizable()
                            .frame(width: 200, height: 100, alignment: .leading)
                    }
                }
                Spacer()
                HStack {
                    // I think you'll need a ZStack here to align like your "plan"
                    Image("Home Plant 3")
                        .resizable()
                        .frame(width: 185, height: 120, alignment: .leading)
                        .padding(.horizontal, 20.0)
                    Spacer()
                    NavigationLink(destination: TrackersView()
                        .navigationBarTitle("")  // for some reason you need a title (ANY title) in order to hide the navigation bar
                        .navigationBarHidden(true)
                    ) {
                        Image("Home Trackers Button")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 189, height: 100, alignment: .leading)
                            .padding(.horizontal, 20.0)
                    }
                }
                Spacer()
                HStack {
                    VStack {
                        Image("Home Snack Button")
                            .resizable()
                            .frame(width: 175, height: 70, alignment: .leading)
                            .padding(.horizontal, 20.0)
                        
                        NavigationLink(destination: WelcomeView(goalOfTheDay: $settings.goalOfTheDay)
                            .navigationBarTitle("")  // for some reason you need a title (ANY title) in order to hide the navigation bar
                            .navigationBarHidden(true)
                        ) {
                            Image("Back Button").renderingMode(.original).resizable().padding([.leading, .bottom]).frame(width: 100, height: 57, alignment: .center)
                        }
                    }
                    Spacer()
                    Image("Home Plant 4")
                        .resizable()
                        .frame(width: 200, height: 100, alignment: .leading)
                }
            } // end VStack
        }  // end NavigationView
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

