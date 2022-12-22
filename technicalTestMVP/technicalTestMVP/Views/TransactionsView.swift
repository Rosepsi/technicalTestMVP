//
//  View.swift
//  technicalTestMVP
//
//  Created by Rosa Herrero on 22/12/22.
//

import UIKit

class TransactionsView : UIViewController {
    
    @IBOutlet weak var tableTransactions : UITableView!
    weak var presenter : TransactionsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableTransactions.delegate = self
        tableTransactions.dataSource = self
        tableTransactions.tableFooterView = UIView()
        tableTransactions.register(UINib (nibName: "TransactionCell", bundle: nil), forCellReuseIdentifier: "reusableTransactionCell")
    }
}

extension TransactionsView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableTransactionCell") as! TransactionCell
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}
