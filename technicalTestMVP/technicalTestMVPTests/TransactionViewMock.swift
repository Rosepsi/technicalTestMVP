//
//  TransactionViewMock.swift
//  technicalTestMVPTests
//
//  Created by Rosa Herrero on 9/1/23.
//

import XCTest
@testable import technicalTestMVP

class TransactionViewMock : TransactionsView {
    
    var flag : Bool = false
    var expectation : XCTestExpectation?
    
    func reLoadTransactions() {
        flag = true
        expectation?.fulfill()
    }
    
    
}
    
