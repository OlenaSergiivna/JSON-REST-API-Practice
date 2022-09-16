//
//  Realm.swift
//  JSON + REST API Practice
//
//  Created by user on 16.09.2022.
//

import Foundation
import RealmSwift

class TrendsRealm: Object {
    @Persisted var page: Int
    @Persisted var results: List<MovieRealm>
    @Persisted var totalPages: Int
    @Persisted var totalResults: Int
}

class MovieRealm: Object {
    
    @Persisted var adult: Bool
    @Persisted var backdropPath: String?
    @Persisted var id: Int
    @Persisted var name: String?
    @Persisted var originalLanguage: String
    @Persisted var originalName: String?
    @Persisted var overview: String?
    @Persisted var posterPath: String?
    @Persisted var mediaType: String
    @Persisted var genreIDS: List<Int>
    @Persisted var popularity: Double
    @Persisted var firstAirDate: String?
    @Persisted var voteAverage: Double
    @Persisted var voteCount: Int
    @Persisted var originCountry: List<String?>
    @Persisted var title: String?
    @Persisted var originalTitle: String?
    @Persisted var releaseDate: String?
    @Persisted var video: Bool?

}

