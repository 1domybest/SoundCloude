//
//  Track.swift
//
//
//  Created by Ryan Forsyth on 2023-10-03.
//

import Foundation

public struct Track: Codable, Identifiable {
    public let id: Int
    public let urn: String?
    public let createdAt: String
    public let duration: Int
    public let commentCount: Int?
    public let commentable: Bool?
    public let sharing: String
    public let tagList: String
    public let streamable: Bool?
    public let genre: String?
    public let title: String
    public let description: String?
    public let license: String
    public let uri: String
    public let user: User
    public let permalinkUrl: String
    public let artworkUrl: String?
    public var streamUrl: String?
    public let downloadUrl: String?
    public let waveformUrl: String
    public let availableCountryCodes: [String]?
    public var userFavorite: Bool
    public let userPlaybackCount: Int
    public let playbackCount: Int?
    public let favoritingsCount: Int?
    public let repostsCount: Int?
    public let access: String // playable / preview / blocked
    
    // Additional SoundCloud fields
    public let bpm: Int?
    public let downloadCount: Int?
    public let embeddableBy: String?
    public let isrc: String?
    public let keySignature: String?
    public let kind: String?
    public let labelName: String?
    public let permalink: String?
    public let purchaseTitle: String?
    public let purchaseUrl: String?
    public let release: String?
    public let releaseDay: Int?
    public let releaseMonth: Int?
    public let releaseYear: Int?
    public let secretUri: String?
    
    public var localFileUrl: String? = nil // For downloaded tracks
    
    private enum CodingKeys: String, CodingKey {
        case id
        case urn
        case createdAt = "created_at"
        case duration
        case commentCount = "comment_count"
        case commentable
        case sharing
        case tagList = "tag_list"
        case streamable
        case genre
        case title
        case description
        case license
        case uri
        case user
        case permalinkUrl = "permalink_url"
        case artworkUrl = "artwork_url"
        case streamUrl = "stream_url"
        case downloadUrl = "download_url"
        case waveformUrl = "waveform_url"
        case availableCountryCodes = "available_country_codes"
        case userFavorite = "user_favorite"
        case userPlaybackCount = "user_playback_count"
        case playbackCount = "playback_count"
        case favoritingsCount = "favoritings_count"
        case repostsCount = "reposts_count"
        case access
        case bpm
        case downloadCount = "download_count"
        case embeddableBy = "embeddable_by"
        case isrc
        case keySignature = "key_signature"
        case kind
        case labelName = "label_name"
        case permalink
        case purchaseTitle = "purchase_title"
        case purchaseUrl = "purchase_url"
        case release
        case releaseDay = "release_day"
        case releaseMonth = "release_month"
        case releaseYear = "release_year"
        case secretUri = "secret_uri"
        // localFileUrl is not mapped from JSON
    }
}

public extension Track {
    var playbackUrl: String? { localFileUrl ?? streamUrl }
    var durationInSeconds: Int { duration / 1000 }
    var largerArtworkUrl: String? { artworkUrl?.replacingOccurrences(of: "large.jpg", with: "t500x500.jpg") }
    var fileSizeInMb: Double {
        let fileSizeInKb = durationInSeconds * 16 // Based on 128 bitrate
        return Double(fileSizeInKb) / Double(1024)
    }
    
    func localFileUrl(withExtension extension: String) -> URL {
        let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsUrl.appendingPathComponent("\(id).\(`extension`)")
    }
}

extension Track: Equatable {
    public static func ==(lhs: Track, rhs: Track) -> Bool {
        lhs.id == rhs.id
    }
}

extension Track: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

/*
 API image sizes:

 t500x500:     500px×500px
 crop:         400px×400px
 t300x300:     300px×300px
 large:        100px×100px  (default)
 t67x67:       67px×67px    (only on artworks)
 badge:        47px×47px
 small:        32px×32px
 tiny:         20px×20px    (on artworks)
 tiny:         18px×18px    (on avatars)
 mini:         16px×16px
 original:     originally uploaded image
 */
