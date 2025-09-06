//
//  File.swift
//  SoundCloude
//
//  Created by 온석태 on 9/6/25.
//

import Foundation

public struct TrackBody: Codable, Identifiable {
    public let id: Int
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
    public let access: String
    
    // JSON에 추가된 필드들
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
    public let urn: String?

    private enum CodingKeys: String, CodingKey {
        case id
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
        case urn
    }
}

extension TrackBody: Equatable {
    public static func ==(lhs: TrackBody, rhs: TrackBody) -> Bool {
        lhs.id == rhs.id
    }
}

extension TrackBody: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
