//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by kaki on 2023/01/25.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_비었을경우_isEmpty가_true이다() {
        let result = sut.isEmpty
        let expectation = true
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_비었을경우_size가_0이다() {
        let result = sut.size
        let expectation = 0
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueue_됐을경우_isEmpty가_false이다() {
        sut.enqueue(data: "111")
        let result = sut.isEmpty
        let expectation = false
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_한번_enqueue_됐을경우_size가_1이다() {
        sut.enqueue(data: "111")
        let result = sut.size
        let expectation = 1
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_세번_enqueue_됐을경우_size가_3이다() {
        sut.enqueue(data: "111")
        sut.enqueue(data: "222")
        sut.enqueue(data: "333")
        let result = sut.size
        let expectation = 3
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeue_됐을경우_처음에_enqueue_해준_데이터가_반환된다() {
        sut.enqueue(data: "111")
        sut.enqueue(data: "222")
        sut.enqueue(data: "333")
        let result = sut.dequeue()!
        let expectation = "111"
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeue_됐을경우_size가_감소한다() {
        sut.enqueue(data: "111")
        sut.enqueue(data: "222")
        sut.enqueue(data: "333")
        let _ = sut.dequeue()
        let result = sut.size
        let expectation = 2
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_빈queue를_dequeue_할경우_nil이_반환된다() {
        let result = sut.dequeue()
        let expectation: String? = nil
        
        XCTAssertEqual(result, expectation)
    }
    
}