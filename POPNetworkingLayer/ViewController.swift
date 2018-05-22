//
//  ViewController.swift
//  POPNetworkingLayer
//
//  Created by Carles Grau Galvan on 14/02/2018.
//  Copyright © 2018 Carles Grau Galvan. All rights reserved.
//

import UIKit
import RxSwift

final class ViewController: UIViewController {
    
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var actInd: UIActivityIndicatorView!
    var presenter: Presenter = Presenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func getRandomPerson(_ sender: Any) {
        presenter.didLoad()
    }
}

extension ViewController: PeopleView {
    func update(with results: [Person]) {
        let person = results[0]
        self.personName.text = "fullname: \(person.name.title) \(person.name.first) \(person.name.last)\nGender: \(person.gender)"
    }
    
    func setLoading(_ loading: Bool) {
        if loading {
            actInd.startAnimating()
        } else {
            actInd.stopAnimating()
        }
    }
}

