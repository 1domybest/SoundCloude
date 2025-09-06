//
//  File.swift
//  SoundCloude
//
//  Created by 온석태 on 9/6/25.
//

import Foundation

public struct TrackBody: Codable, Identifiable {
    public var id: Int
    public var artworkUrl: String?
    public var availableCountryCodes: [String]?
    public var bpm: Int?
    public var commentCount: Int?
    public var commentable: Bool?
    public var createdAt: String?
    public var description: String?
    public var downloadCount: Int?
    public var downloadUrl: String?
    public var downloadable: Bool?
    public var duration: Int?
    public var embeddableBy: String?
    public var favoritingsCount: Int?
    public var genre: String?
    public var urn: String?
    public var isrc: String?
    public var keySignature: String?
    public var kind: String?
    public var labelName: String?
    public var license: String?
    public var permalinkUrl: String?
    public var playbackCount: Int?
    public var purchaseTitle: String?
    public var purchaseUrl: String?
    public var release: String?
    public var releaseDay: Int?
    public var releaseMonth: Int?
    public var releaseYear: Int?
    public var repostsCount: Int?
    public var secretUri: String?
    public var sharing: String?
    public var streamUrl: String?
    public var streamable: Bool?
    public var tagList: String?
    public var title: String?
    public var uri: String?
    public var userFavorite: Bool?
    public var userPlaybackCount: Int?
    public var waveformUrl: String?
    public var access: String?

    public var policy: String?
    public var monetizationModel: String?
    public var metadataArtist: String?

//    private enum CodingKeys: String, CodingKey {
//        case artworkUrl = "artwork_url"
//        case availableCountryCodes = "available_country_codes"
//        case bpm
//        case commentCount = "comment_count"
//        case commentable
//        case createdAt = "created_at"
//        case description
//        case downloadCount = "download_count"
//        case downloadUrl = "download_url"
//        case downloadable
//        case duration
//        case embeddableBy = "embeddable_by"
//        case favoritingsCount = "favoritings_count"
//        case genre
//        case id
//        case urn
//        case isrc
//        case keySignature = "key_signature"
//        case kind
//        case labelName = "label_name"
//        case license
//        case permalinkUrl = "permalink_url"
//        case playbackCount = "playback_count"
//        case purchaseTitle = "purchase_title"
//        case purchaseUrl = "purchase_url"
//        case release
//        case releaseDay = "release_day"
//        case releaseMonth = "release_month"
//        case releaseYear = "release_year"
//        case repostsCount = "reposts_count"
//        case secretUri = "secret_uri"
//        case sharing
//        case streamUrl = "stream_url"
//        case streamable
//        case tagList = "tag_list"
//        case title
//        case uri
//        case userFavorite = "user_favorite"
//        case userPlaybackCount = "user_playback_count"
//        case waveformUrl = "waveform_url"
//        case access
//        case policy
//        case monetizationModel = "monetization_model"
//        case metadataArtist = "metadata_artist"
//    }

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
