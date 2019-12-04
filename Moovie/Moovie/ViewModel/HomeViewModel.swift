//
//  HomeViewModel.swift
//  Moovie
//
//  Created by Luiz Henrique de Sousa on 04/12/19.
//  Copyright © 2019 Luiz Henrique. All rights reserved.
//

import Foundation

class HomeViewModel {
    var numberOfRows = 0
    
    private var tableDataSource = [Movie]()
    private var dataModel: PopularMovie! {
        didSet {
            configureTableDataSource()
            configureOutput()
        }
    }
    
    var viewDidLoad: () -> () = { }
    
    init() {
       viewDidLoad = { [weak self] in
            self?.getPopularMovies()
        }
    }
    
    private func getPopularMovies() {
       Manager.shared.request(.get, .popularMovies, nil, nil) { [weak self]
           result in
           switch result {
           case .success(let json):
               do {
                let jsonData = try json.rawData(options: .fragmentsAllowed)
                   let response = try! JSONDecoder().decode(PopularMovie.self, from: jsonData)
                self?.dataModel = response
               } catch {
                   print(error)
               }
               
           case .failure(let error):
               print(error.localizedDescription)
           }
       }
    }
    
    
    private func configureTableDataSource() {
        tableDataSource = dataModel.results ?? []
    }
    
    private func configureOutput() {
        numberOfRows = tableDataSource.count
    }
    
    func tableCellDataModelForIndexPath(_ indexPath: IndexPath) -> Movie {
        return tableDataSource[indexPath.row]
    }
}
