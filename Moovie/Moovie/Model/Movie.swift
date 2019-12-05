//
//  Movie.swift
//  Moovie
//
//  Created by Luiz Henrique de Sousa on 04/12/19.
//  Copyright © 2019 Luiz Henrique. All rights reserved.
//

import Foundation

struct Movie: Codable {
    var poster_path: String?
    var adult: Bool?
    var overview: String?
    var release_date: String?
    var genre_ids: [Int]?
    var id: Int?
    var original_title: String?
    var original_language: String?
    var title: String?
    var backdrop_path: String?
    var popularity: Double?
    var vote_count: Int?
    var video: Bool?
    var vote_average: Double?
    
    func getPosterPath() -> String {
        if let posterPath = poster_path {
           return "http://image.tmdb.org/t/p/w185/" + posterPath
        }
        return ""
        
    }
    
    func getFirstGenreId()->String {
        if genre_ids != nil, let firstGenre = genre_ids?.first {
            return Parse.getGenreTitleBy(id: firstGenre)
        }
        return "-"
    }
    

}
