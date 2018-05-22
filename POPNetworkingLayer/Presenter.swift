//
//  Presenter.swift
//  POPNetworkingLayer
//
//  Created by Carles Grau Galvan on 14/02/2018.
//  Copyright © 2018 Carles Grau Galvan. All rights reserved.
//

import RxSwift

class Presenter: PeoplePresenter {
    private let webService = WebService()
    private let disposeBag = DisposeBag()
    var view: PeopleView?
    
    
    func didLoad() {
        view?.setLoading(true)
        
        let people = webService.load(modelType: Results.self, from: .getPosts)
        people.observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] (results) in
                self?.view?.update(with: results.results)
                }, onDisposed: { [weak self] in
                    self?.view?.setLoading(false)
            }).disposed(by: disposeBag)
    }
    
}
