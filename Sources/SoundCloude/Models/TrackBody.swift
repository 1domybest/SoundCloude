//
//  File.swift
//  SoundCloude
//
//  Created by 온석태 on 9/6/25.
//

import Foundation

public struct TrackBody: Codable, Identifiable {
    public var id: Int
    public var artwork_url: String?
    public var available_country_codes: [String]?
    public var bpm: Int?
    public var comment_count: Int?
    public var commentable: Bool?
    public var created_at: String?
    public var description: String?
    public var download_count: Int?
    public var download_url: String?
    public var downloadable: Bool?
    public var duration: Int?
    public var embeddable_by: String?
    public var favoritings_count: Int?
    public var genre: String?
    public var urn: String?
    public var isrc: String?
    public var key_signature: String?
    public var kind: String?
    public var label_name: String?
    public var license: String?
    public var permalink_url: String?
    public var playback_count: Int?
    public var purchase_title: String?
    public var purchase_url: String?
    public var release: String?
    public var release_day: Int?
    public var release_month: Int?
    public var release_year: Int?
    public var reposts_count: Int?
    public var secret_uri: String?
    public var sharing: String?
    public var stream_url: String?
    public var streamable: Bool?
    public var tag_list: String?
    public var title: String?
    public var uri: String?
    public var user_favorite: Bool?
    public var user_playback_count: Int?
    public var waveform_url: String?
    public var access: String?

    
    public var policy: String?
    public var monetization_model: String?
    public var metadata_artist: String?

    // 🔹 보기 좋은 releaseDate 조립
    public var releaseDate: String? {
        guard let y = release_year, let m = release_month, let d = release_day else { return nil }
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
