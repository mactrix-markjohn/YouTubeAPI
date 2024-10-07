//
//  ContentView.swift
//  YouTubeAPI
//
//  Created by mac on 03/10/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "play.square.stack")
                    Text("Feed")
                }
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    HomeView()
}
