//
//  SplashScreen.swift
//  SAGEb
//
//  Created by brad.hontz on 3/8/20.
//  Copyright © 2020 brad.hontz. All rights reserved.
//

import SwiftUI

// a simple splash screen containing a background color and an image
// note that you should set the LaunchScreen.storyboard's background color to this
// same color, otherwise, there will be a flash of a different color during startup
// (the LaunchScreen.storyboard appears momentarily before this screen)

struct SplashScreen: View {
    var body: some View {
        ZStack {
            Color("khaki")
            .edgesIgnoringSafeArea(.all)
            Image("SageStartUp")
            .resizable()
            .frame(width: 200, height: 200, alignment: .center)
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
