//
//  ContentView.swift
//  Sage
//
//  Created by brad.hontz on 3/11/20.
//  Copyright © 2020 brad.hontz. All rights reserved.
//

import SwiftUI

// we need these next three structures for the QOD API call

struct Response: Decodable {
    var contents: Quotes
}

struct Quotes: Decodable {
    var quotes: [Result]
}

struct Result: Decodable {
    var date: String
    var quote: String
}

struct ContentView: View {
    @State var showSplash = true
    @State private var results: [Result] = [Result(date:"", quote:"")]
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        ZStack {
            WelcomeView(goalOfTheDay: $settings.goalOfTheDay)
            SplashScreen()
            .opacity(showSplash ? 1: 0)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3 ) {
                    self.showSplash = false
                }
            }
        }
        .onAppear(perform: loadData)
    }
    // this function loads the QOD from the API below
    func loadData() {
        guard let url = URL(string: "https://quotes.rest/qod.json?category=inspire") else {
            print("invalid URL!")
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    DispatchQueue.main.async {
                        self.results = decodedResponse.contents.quotes
                        self.settings.quoteOfTheDay = self.results[0].quote
                        self.settings.goalOfTheDay = ""
                    }
                }
                return
            }
            print("fetch failed: \(error?.localizedDescription ?? "Unknown Error")")
        }.resume()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
