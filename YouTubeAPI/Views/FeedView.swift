//
//  FeedView.swift
//  YouTubeAPI
//
//  Created by mac on 03/10/2024.
//

import SwiftUI

struct FeedView: View {
    
    @State private var videos = [Video]()
    @State private var selectedVideo: Video?
    
    var body: some View {
        List(videos) { v in
            //Text(v.snippet?.title ?? "Tittle")
            VideoRowView(video: v)
                .onTapGesture {
                    selectedVideo = v
                }
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .scrollIndicators(.hidden)
        .padding(.horizontal)
        .task {
                self.videos = await DataServices().getVideo()
                
        }
        .sheet(item: $selectedVideo) { v in
            VideoDetailView(video: v)
        }
        
    }
}

#Preview {
    FeedView()
}
