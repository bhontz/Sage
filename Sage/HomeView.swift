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
                Text("Today I will ...")
                    .font(.custom("HelveticaNeue-Light", size: 32))
                    .foregroundColor(Color.gray)
                    .padding(.trailing, 140)
                    .frame(width: 350, height: 40)
                    .offset(y: -30)
                Text(settings.goalOfTheDay)
                    .font(.custom("HelveticaNeue-UltraLight", size: 24))
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .padding(.horizontal, 50)
                    .offset(y: -20)
                Spacer()
                HStack {
                    NavigationLink(destination: ToDoView()
                        .navigationBarTitle("")  // for some reason you need a title (ANY title) in order to hide the navigation bar
                        .navigationBarHidden(true)
                    ) {
                    Image("Home To-Do Button")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 160, height: 55, alignment: .leading)  // was 176, 70
                        .padding(.horizontal, 40.0)
                        .offset(x: 10, y: -25)
                    }
                    Spacer()
                    Image("Home Plant 1")
                        .resizable()
                        .frame(width: 250, height: 110, alignment: .leading)  // was 200, 100
                        .offset(x: -50)
                }  // end HStack
                Spacer()
                ZStack {
                    HStack {
                        Image("Home Plant 2")
                            .resizable()
                            .frame(width: 320, height: 225, alignment: .leading)
                            .padding(.horizontal, 50.0)
                            Spacer()
                    }
                    HStack {
                        NavigationLink(destination: StudyScheduleView()
                            .navigationBarTitle("")  // for some reason you need a title (ANY title) in order to hide the navigation bar
                            .navigationBarHidden(true)
                        ) {
                            Image("Home Schedule Button")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 185, height: 80, alignment: .leading)
                                .padding(.horizontal, 40.0)
                                .offset(x: 10, y: 30)
                        }
                        Spacer()
                        Image("Home Stress Relief Button")
                            .resizable()
                            .frame(width: 200, height: 100, alignment: .leading)
                            .offset(x: -60, y: -70)
                    } // end HStack
                }  // end ZStack
                Spacer()
                HStack {
                    Image("Home Plant 3")
                        .resizable()
                        .frame(width: 185, height: 120, alignment: .leading)
                        .offset(x: 60, y: -10)
                    Spacer()
                    NavigationLink(destination: TrackersView()
                        .navigationBarTitle("")  // for some reason you need a title (ANY title) in order to hide the navigation bar
                        .navigationBarHidden(true)
                    ) {
                    Image("Home Trackers Button")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 210, height: 80, alignment: .leading)
                        .offset(x: -50)
                    }
                } // end HStack
                Spacer()
                HStack {
                    VStack {
                        Image("Home Snack Button")
                            .resizable()
                            .frame(width: 175, height: 70, alignment: .leading)
                            .offset(x: 60)
                        
                        NavigationLink(destination: WelcomeView(goalOfTheDay: $settings.goalOfTheDay)
                            .navigationBarTitle("")  // for some reason you need a title (ANY title) in order to hide the navigation bar
                            .navigationBarHidden(true)
                        ) {
                        Image("Back Button").renderingMode(.original).resizable().padding([.leading, .bottom]).frame(width: 100, height: 57, alignment: .center)
                        }
                    } // end VStack
                    Spacer()
                    Image("Home Plant 4")
                        .resizable()
                        .frame(width: 220, height: 100, alignment: .leading)
                        .offset(x: -50, y: -10)
                } // end HStack
            } // end Overall VStack
        }  // end NavigationView
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

