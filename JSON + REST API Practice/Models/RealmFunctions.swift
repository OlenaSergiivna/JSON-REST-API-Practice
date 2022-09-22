//
//  File.swift
//  JSON + REST API Practice
//
//  Created by user on 16.09.2022.
//

import Foundation
import RealmSwift


private var realm = try! Realm()

func deleteAll() {
    
    try! realm.write {
        realm.deleteAll()
    }
}


func saveInRealm(movies: [Movie]) {
    
    
    for movie in movies {
        
        let movieRealm = MovieRealm()
        movieRealm.adult = movie.adult
        movieRealm.backdropPath = movie.backdropPath
        movieRealm.id = movie.id
        movieRealm.name = movie.name
        movieRealm.overview = movie.overview
        movieRealm.posterPath = movie.posterPath
        movieRealm.mediaType = movie.mediaType
        movieRealm.genreIDS.append(objectsIn: movie.genreIDS)
        movieRealm.popularity = movie.popularity
        movieRealm.firstAirDate = movie.firstAirDate
        movieRealm.voteAverage = movie.voteAverage
        movieRealm.voteCount = movie.voteCount
        movieRealm.originCountry.append(objectsIn: movie.originCountry ?? [])
        movieRealm.title = movie.title
        movieRealm.originalTitle = movie.originalTitle
        movieRealm.releaseDate = movie.releaseDate
        movieRealm.video = movie.video
        movieRealm.originalLanguage = movie.originalLanguage
        
        
        try? realm.write {
            
                realm.add(movieRealm, update: .all)
 
        }
        
    }
    
}


func getFromRealm() -> [MovieRealm] {
    
    let results = realm.objects(MovieRealm.self)
    return Array(results)
}
