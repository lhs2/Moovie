//
//  HomeViewModel.swift
//  Moovie
//
//  Created by Luiz Henrique de Sousa on 04/12/19.
//  Copyright © 2019 Luiz Henrique. All rights reserved.
//

import Foundation
import RxSwift

class HomeViewModel {
    var numberOfRows = 0
    var rows = PublishSubject<Int>()
    internal var canRequestPagination: Bool = false
    internal var currentPage = 1
    
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
    
    func requestPagination() {
        if(canRequestPagination) {
            canRequestPagination = false
            currentPage += 1
            getPopularMovies()
        }
    }
    
    private func getPopularMovies() {
        var pathParam: [CVarArg] = []
        pathParam.append(currentPage as CVarArg)
       Manager.shared.request(.get, .popularMovies, pathParam, nil) { [weak self]
           result in
           switch result {
           case .success(let json):
               do {
                let jsonData = try json.rawData(options: .fragmentsAllowed)
                var response = try! JSONDecoder().decode(PopularMovie.self, from: jsonData)
                self?.canRequestPagination = true
                if let currentResponse = self?.dataModel,
                    let currentMovies = currentResponse.results {
                    response.results = currentMovies + (response.results ?? [])
                }
                self?.dataModel = response
               } catch {
                self?.rows.onNext(-1)
               }
               
           case .failure(let error):
               print(error.localizedDescription)
            self?.rows.onNext(-2)
           }
       }
    }
    
    private func configureTableDataSource() {
        tableDataSource = dataModel.results ?? []
    }
    
    private func configureOutput() {
        numberOfRows = tableDataSource.count
        rows.onNext(numberOfRows)
        
    }
    
    func tableCellDataModelForIndexPath(_ indexPath: IndexPath) -> Movie {
        return tableDataSource[indexPath.section]
    }
}
