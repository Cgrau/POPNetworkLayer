//
//  Presenter.swift
//  POPNetworkingLayer
//
//  Created by Carles Grau Galvan on 14/02/2018.
//  Copyright © 2018 Carles Grau Galvan. All rights reserved.
//

import Foundation

protocol PeopleView: class {
    func setLoading(_ loading: Bool)
    func update(with results: [Person])
}

protocol PeoplePresenter: class {
    weak var view: PeopleView? { get set }
    
    func didLoad()
}
