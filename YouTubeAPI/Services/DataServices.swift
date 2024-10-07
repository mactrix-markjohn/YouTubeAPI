//
//  DataServices.swift
//  YouTubeAPI
//
//  Created by mac on 03/10/2024.
//

import Foundation

struct DataServices {
    
    private let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func getVideo() async -> [Video] {
        
        // Check if Api key is there
        guard apiKey != nil else {
            return [Video]()
        }
        
        // Create the URL
        let urlString = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLMRqhzcHGw1Y5Cluhf7pKRNZtKaA3Q4kg&maxResults=20&key=\(apiKey!)"
        let url = URL(string: urlString)
        
        if let url = url {
            // Create the request
            let request = URLRequest(url: url)
            let session = URLSession.shared
            
            // Send the request
            do {
                let (data, _) = try await session.data(for: request)
                
                // Parse the data
                let decoder = JSONDecoder()
                let playlist = try decoder.decode(Playlist.self, from: data)
                
                return playlist.items
            }
            catch{
                print(error)
            }
            
            // Parse
        }
       
        
        return [Video]()
    }
    
}
