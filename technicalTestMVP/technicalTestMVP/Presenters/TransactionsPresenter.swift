//
//  ViewController.swift
//  technicalTestMVP
//
//  Created by Rosa Herrero on 22/12/22.
//

import UIKit

class TransactionsPresenter {
    
    let view: TransactionsView
    let networkManager: NetworkManager
    var transactions : Transactions = []
    init(view: TransactionsView, networkManager: NetworkManager = DefaultNetworkManager()) {
        self.networkManager = networkManager
        self.view = view
    }
    func loadTransactions () {
        networkManager
            .getTransactions { transactions in
                DispatchQueue.main.async {
                    let transactionsNoNil = transactions.filter { $0.date != nil }.sorted { $0.date! > $1.date! }
                    var transactionsFiltered : Transactions = []
                    for transaction in transactionsNoNil {
                        if !transactionsFiltered.contains( where: { $0.id == transaction.id }) {
                            transactionsFiltered.append(transaction)
                        }
                    }
                    self.transactions = transactionsFiltered
                    self.view.reLoadTransactions()
                }
            }
        }
    }
