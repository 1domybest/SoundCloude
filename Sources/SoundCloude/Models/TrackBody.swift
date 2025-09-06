//
//  File.swift
//  SoundCloude
//
//  Created by 온석태 on 9/6/25.
//

import Foundation

public struct TrackBody: Codable, Identifiable {
    public let id: Int
    public let artworkUrl: String?
    public let availableCountryCodes: [String]?
    public let bpm: Int?
    public let commentCount: Int?
    public let commentable: Bool?
    public let createdAt: String
    public let description: String?
    public let downloadCount: Int?
    public let downloadUrl: String?
    public let downloadable: Bool?
    public let duration: Int
    public let embeddableBy: String?
    public let favoritingsCount: Int?
    public let genre: String?
    public let urn: String?
    public let isrc: String?
    public let keySignature: String?
    public let kind: String?
    public let labelName: String?
    public let license: String
    public let permalinkUrl: String?
    public let playbackCount: Int?
    public let purchaseTitle: String?
    public let purchaseUrl: String?
    public let release: String?
    public let releaseDay: Int?
    public let releaseMonth: Int?
    public let releaseYear: Int?
    public let repostsCount: Int?
    public let secretUri: String?
    public let sharing: String
    public let streamUrl: String?
    public let streamable: Bool?
    public let tagList: String?
    public let title: String
    public let uri: String
    public let userFavorite: Bool?
    public let userPlaybackCount: Int?
    public let waveformUrl: String
    public let access: String

    // 🔹 JSON에는 있는데 빠져있던 필드들
    public let policy: String?
    public let monetizationModel: String?
    public let metadataArtist: String?

    private enum CodingKeys: String, CodingKey {
        case artworkUrl = "artwork_url"
        case availableCountryCodes = "available_country_codes"
        case bpm
        case commentCount = "comment_count"
        case commentable
        case createdAt = "created_at"
        case description
        case downloadCount = "download_count"
        case downloadUrl = "download_url"
        case downloadable
        case duration
        case embeddableBy = "embeddable_by"
        case favoritingsCount = "favoritings_count"
        case genre
        case id
        case urn
        case isrc
        case keySignature = "key_signature"
        case kind
        case labelName = "label_name"
        case license
        case permalinkUrl = "permalink_url"
        case playbackCount = "playback_count"
        case purchaseTitle = "purchase_title"
        case purchaseUrl = "purchase_url"
        case release
        case releaseDay = "release_day"
        case releaseMonth = "release_month"
        case releaseYear = "release_year"
        case repostsCount = "reposts_count"
        case secretUri = "secret_uri"
        case sharing
        case streamUrl = "stream_url"
        case streamable
        case tagList = "tag_list"
        case title
        case uri
        case userFavorite = "user_favorite"
        case userPlaybackCount = "user_playback_count"
        case waveformUrl = "waveform_url"
        case access
        case policy
        case monetizationModel = "monetization_model"
        case metadataArtist = "metadata_artist"
    }

    // 🔹 보기 좋은 releaseDate 조립
    public var releaseDate: String? {
        guard let y = releaseYear, let m = releaseMonth, let d = releaseDay else { return nil }
        return String(format: "%04d-%02d-%02d", y, m, d)
    }
}

// Equatable/Hashable 동일
extension TrackBody: Equatable {
    public static func ==(lhs: TrackBody, rhs: TrackBody) -> Bool { lhs.id == rhs.id }
}
extension TrackBody: Hashable {
    public func hash(into hasher: inout Hasher) { hasher.combine(id) }
}
