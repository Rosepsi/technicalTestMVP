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
    var sut: TransactionsPresenter!
    
    // esta funcion se llama ANTES de cada test (para prepararlo)
    override func setUp() {
        super.setUp()
        sut = TransactionsPresenter (networkManager: networkManager)
    }
    
    // esta funcion se llama DESPUES de cada test (para limpiar o dejar preparado el siguiente)
    override func tearDown() {
        super.tearDown()
        networkManager.forceError = false // dejamos el mock en su estado original
    }
    
    func testGetFoodResultPositive () {
        // Given
        let searchtest = "cereal" // probamos un valor que sabemos que funcionará
        sut.completionSearch = { results in
            // Then
            XCTAssert(results.isEmpty == false)
        }
        // When
        sut.getFoodVM(text: searchtest)
    }
    func testGetFoodResultNegative () {
        // Given
        let searchtest = "cereal" // probamos un valor que sabemos que funcionará
        sut.completionSearch = { results in
            // Then
            XCTAssert(results.isEmpty == false)
        }
        // When
        sut.getFoodVM(text: searchtest)
    }
    func testGetFoodResultFail () {
        // Given
        let searchtest = "cereal" // probamos un valor que sabemos que funcionará
        sut.completionSearch = { results in
            // Then
            XCTAssert(results.isEmpty == false)
        }
        // When
        sut.getFoodVM(text: searchtest)
    }
}
