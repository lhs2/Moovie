//
//  HomeController.swift
//  Moovie
//
//  Created by Luiz Henrique de Sousa on 03/12/19.
//  Copyright © 2019 Luiz Henrique. All rights reserved.
//

import UIKit
import Alamofire
import RxSwift

class HomeController: UIViewController, Storyboarded{

    weak var coordinator: SDCoordinator?
    let viewModel = HomeViewModel()
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindWithUI()
        viewModel.viewDidLoad()
    }
    
    
    private func setupBindWithUI() {
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeCell")
        
        viewModel.rows.asObserver()
        .subscribe(onNext: { [weak self] (value) in
            if(value >= 0) {
                self?.tableView.reloadData()
            }
            else if(value == -1) {
                self?.alert(title: "Aviso", error: "Ocorreu um erro na conversão das informações. Tente novamente mais tarde", buttonTexts: ["OK :("])
            }else {
                self?.alert(title: "Aviso", error: "Ocorreu um erro ao obter informações.", buttonTexts: ["OK"])
            }
        })
        .disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension HomeController: UISearchBarDelegate {
    
}

extension HomeController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfRows
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 132.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Coordinator flow to next page
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeTableViewCell
        let cellDataModel = viewModel.tableCellDataModelForIndexPath(indexPath)
        cell.configureCell(model: cellDataModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if section == viewModel.numberOfRows-1{
            viewModel.requestPagination()
        }
    }

}
