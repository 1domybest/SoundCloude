public struct TrackBody: Codable, Identifiable, Hashable {
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

    // 추가 필드 (응답에 있음)
    public var policy: String?
    public var monetizationModel: String?
    public var metadataArtist: String?

    public var releaseDate: String? {
        guard let y = releaseYear, let m = releaseMonth, let d = releaseDay else { return nil }
        return String(format: "%04d-%02d-%02d", y, m, d)
    }

    // Equatable/Hashable는 id 기준이면 충분
    public static func == (lhs: TrackBody, rhs: TrackBody) -> Bool { lhs.id == rhs.id }
    public func hash(into hasher: inout Hasher) { hasher.combine(id) }
}
