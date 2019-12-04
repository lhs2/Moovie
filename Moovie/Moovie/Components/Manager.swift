//
//  Manager.swift
//  Moovie
//
//  Created by Luiz Henrique de Sousa on 03/12/19.
//  Copyright © 2019 Luiz Henrique. All rights reserved.
//

import Foundation
import Alamofire

class Manager {
    
    static let shared: Manager = Manager()
    
    private init() {
        self.manager = Alamofire.SessionManager()
    }
    
    static let BASE_URL = "https://api.themoviedb.org/3/"
    static let API_KEY = "29e0f974a987f6e8f7932bef496b6a28"
    private let manager: Alamofire.SessionManager!
    
    private var headers: HTTPHeaders = [
        "Authorization": "",
        "Accept": "application/json"
    ]
    
    enum Endpoint: String {
        case guestToken = "authentication/guest_session/new?api_key="
        case popularMovies = "movie/popular?language=pt-BR&page=%@&api_key="
    }
    
        func request(_ method          : Alamofire.HTTPMethod,
                     _ endpoint        : Endpoint,
                     _ pathParamenters : [CVarArg]?,
                     _ parameters      : [String:Any]?,
                     handler: @escaping ((_ status: Bool, _ message: String)->Void)) {
        
        
            var requestURL = Manager.BASE_URL + endpoint.rawValue + Manager.API_KEY
        
        if pathParamenters != nil && (pathParamenters?.count)! > 0 {
            requestURL = String.init(format: requestURL, arguments: pathParamenters!)
        }
        
        let encoding: ParameterEncoding = JSONEncoding.default
        self.manager.request(requestURL, method: method, parameters: parameters, encoding: encoding, headers: headers).responseJSON { response in
                let popularResponse = response.flatMap { json in
                                //try PopularMovies(json: json) 
                }
            }
                
        }

    
}

