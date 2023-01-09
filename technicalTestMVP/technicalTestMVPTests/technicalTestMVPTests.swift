//
//  technicalTestMVPTests.swift
//  technicalTestMVPTests
//
//  Created by Rosa Herrero on 22/12/22.
//

import XCTest
@testable import technicalTestMVP

final class technicalTestMVPTests : XCTestCase {
    
    let networkManager = NetworkManagerMock()
    let transactionView = TransactionViewMock ()
    var sut: TransactionsPresenter!
    
    // esta funcion se llama ANTES de cada test (para prepararlo)
    override func setUp() {
        super.setUp()
        sut = TransactionsPresenter (view: transactionView, networkManager: networkManager)
    }
    
    // esta funcion se llama DESPUES de cada test (para limpiar o dejar preparado el siguiente)
    
    override func tearDown() {
        super.tearDown()
        // dejamos el mock en su estado original
        networkManager.forceError = false
        transactionView.flag = false
        transactionView.expectation = nil
    }
    
    func testLoadTransactionEmpty () {
        // Given
        networkManager.forceError = true
        let expectation = self.expectation(description: "Transaction")
        transactionView.expectation = expectation
        // When
        sut.loadTransactions()
        // Then
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual (sut.transactions.isEmpty,true)
    }
    func testLoadTransactionNoEmpty () {
        // Given
        let expectation = self.expectation(description: "Transaction")
        transactionView.expectation = expectation
        // When
        sut.loadTransactions()
        // Then
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual (sut.transactions.isEmpty,false)
    }
}
