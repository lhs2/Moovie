//
//  PopularMovie.swift
//  Moovie
//
//  Created by Luiz Henrique de Sousa on 04/12/19.
//  Copyright © 2019 Luiz Henrique. All rights reserved.
//

import Foundation
import SwiftyJSON

struct PopularMovie: Codable {
    
    var page: Int?
    var results: [Movie]?
    var total_results: Int?
    var total_pages: Int?
    

    
    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        page = try container.decode(Int.self, forKey: .page)
        results = try container.decodeArray(Movie.self, forKey: .results)
        total_results = try container.decode(Int.self, forKey: .total_results)
        total_pages = try container.decode(Int.self, forKey: .total_pages)
    }
    
}
