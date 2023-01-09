//
//  View.swift
//  technicalTestMVP
//
//  Created by Rosa Herrero on 22/12/22.
//

import UIKit

protocol TransactionsView {
    func reLoadTransactions ()
}

class TransactionsViewController : UIViewController, TransactionsView {
    
    @IBOutlet weak var tableTransactions : UITableView!
    lazy var presenter = TransactionsPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableTransactions.delegate = self
        tableTransactions.dataSource = self
        tableTransactions.tableFooterView = UIView()
        tableTransactions.register(UINib (nibName: "TransactionCell", bundle: nil), forCellReuseIdentifier: "reusableTransactionCell")
        presenter.loadTransactions()
    }
    
    func reLoadTransactions () {
        tableTransactions.reloadData()
    }
}

extension TransactionsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableTransactionCell") as! TransactionCell
        let transactions = presenter.transactions
        let transactionCell = transactions [indexPath.row]
        cell.conceptTransaction.text = transactionCell.transactionDescription
        cell.quantityTransaction.text = String (transactionCell.amount + (transactionCell.fee ?? 0))
        if transactionCell.amount > 0 {
            cell.quantityTransaction.textColor = .green
        } else {
            cell.quantityTransaction.textColor = .red
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
    
