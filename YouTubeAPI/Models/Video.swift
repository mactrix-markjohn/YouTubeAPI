//
//  Video.swift
//  YouTubeAPI
//
//  Created by mac on 03/10/2024.
//

import Foundation

struct Video: Decodable, Identifiable {
    var id: String
    var snippet: Snippet?
}

struct Snippet: Decodable {
    var title: String
    var description: String
    var thumbnails: Thumbnails?
    var resourceId: ResourceId?
}

struct ResourceId: Decodable {
    var videoId: String
}

struct Thumbnails: Decodable {
    var medium: ThumbnailSize?
}

struct ThumbnailSize: Decodable {
    var url: String
    var width: Int
    var height: Int
}
