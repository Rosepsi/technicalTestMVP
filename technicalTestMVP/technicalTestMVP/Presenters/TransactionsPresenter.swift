//
//  ViewController.swift
//  technicalTestMVP
//
//  Created by Rosa Herrero on 22/12/22.
//

import UIKit

class TransactionsPresenter {

    let view : TransactionsView
    
    init(view: TransactionsView = TransactionsView(nibName: nil, bundle: nil)) {
        self.view = view
        view.presenter = self
    }
}

