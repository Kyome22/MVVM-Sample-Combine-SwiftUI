//
//  SampleViewModelTests.swift
//  MVVM-Sample-Combine-SwiftUITests
//
//  Created by Takuto Nakamura on 2021/12/15.
//

import XCTest
import Combine
import SwiftUI
@testable import MVVM_Sample_Combine_SwiftUI

class SampleViewModelTests: XCTestCase {
    private var cancellables: Set<AnyCancellable>!

    override func setUp() {
        cancellables = []
    }

    override func tearDown() {
        cancellables.removeAll()
    }
    
    func testValidationResult_beforeInput() {
        let viewModel = SampleViewModel()
        var actualResult: String?
        var actualColor: Color?
        let expectation = self.expectation(description: "IdPasswordChanged")
        expectation.expectedFulfillmentCount = 2
        
        viewModel.$validationResult
            .sink(receiveValue: { result in
                Swift.print("🐷", result)
                actualResult = result
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        viewModel.$loadLabelColor
            .sink(receiveValue: { color in
                Swift.print("🐔", color)
                actualColor = color
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        self.wait(for: [expectation], timeout: 3)
        XCTAssertEqual(actualResult, "IDとPasswordを入力してください。")
        XCTAssertEqual(actualColor, Color.primary)
    }

    func testIdPasswordChanged_finished() {
        let viewModel = SampleViewModel()
        var actualResult: String?
        var actualColor: Color?
        let expectation = self.expectation(description: "IdPasswordChanged")
        expectation.expectedFulfillmentCount = 6
        
        viewModel.$validationResult
            .sink(receiveValue: { result in
                Swift.print("🐷", result)
                actualResult = result
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        viewModel.$loadLabelColor
            .sink(receiveValue: { color in
                Swift.print("🐔", color)
                actualColor = color
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        viewModel.idInputText = "id"
        viewModel.passwordInputText = "password"
        
        self.wait(for: [expectation], timeout: 3)
        XCTAssertEqual(actualResult, "OK!!!")
        XCTAssertEqual(actualColor, Color.green)
    }
    
    func testIdPasswordChanged_failure() {
        let viewModel = SampleViewModel()
        var actualResult: String?
        var actualColor: Color?
        let expectation = self.expectation(description: "IdPasswordChanged")
        expectation.expectedFulfillmentCount = 6
        
        viewModel.$validationResult
            .sink(receiveValue: { result in
                Swift.print("🐷", result)
                actualResult = result
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        viewModel.$loadLabelColor
            .sink(receiveValue: { color in
                Swift.print("🐔", color)
                actualColor = color
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        viewModel.idInputText = ""
        viewModel.passwordInputText = ""
        
        self.wait(for: [expectation], timeout: 3)
        XCTAssertEqual(actualResult, SampleModelError.invalidIdAndPassword.errorText)
        XCTAssertEqual(actualColor, Color.red)
    }
}
