//
//  Parse.swift
//  Moovie
//
//  Created by Luiz Henrique de Sousa on 04/12/19.
//  Copyright © 2019 Luiz Henrique. All rights reserved.
//

import Foundation

class Parse {
    static func getGenreTitleBy(id: Int)->String {
        switch id {
        case 28:
            return "Ação"
        case 12:
            return "Aventura"
        case 16:
            return "Animação"
        case 35:
            return "Comédia"
        case 80:
            return "Crime"
        case 99:
            return "Documentário"
        case 18:
            return "Drama"
        case 10751:
            return "Família"
        case 14:
            return "Fantasia"
        case 36:
            return "História"
        case 27:
            return "Terror"
        case 10402:
            return "Música"
        case 9648:
            return "Mistério"
        case 10749:
            return "Romance"
        case 878:
            return "Ficção científica"
        case 10770:
            return "Cinema TV"
        case 53:
            return "Thriller"
        case 10752:
                return "Guerra"
        case 37:
            return "Faroeste"
        default:
            return "-"
        }
    }
}
