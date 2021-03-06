//
//  MVVMSampleUITests.swift
//  MVVM-Sample-Combine-SwiftUIUITests
//
//  Created by Takuto Nakamura on 2021/12/11.
//

import XCTest

class MVVMSampleUITests: XCTestCase {
    private var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {}

    func testBeforeInput() {
        let window = app.windows["MVVM Sample"]
        
        let validationLabel = window.staticTexts["label-validation"]
        let expect = "IDとPasswordを入力してください。"
        let predicate = NSPredicate(format: "value == %@", expect)
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: validationLabel)
        let result = XCTWaiter().wait(for: [expectation], timeout: 5)
        XCTAssertEqual(result, .completed)
    }
    
    func textInputAndClear() {
        let window = app.windows["MVVM Sample"]

        let idTextField = window.textFields["text-field-id"]
        idTextField.tap()
        idTextField.typeText("id")
        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: 2)
        idTextField.typeText(deleteString)
        
        let validationLabel = window.staticTexts["label-validation"]
        let expect = "IDとPasswordが未入力です。"
        let predicate = NSPredicate(format: "value == %@", expect)
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: validationLabel)
        let result = XCTWaiter().wait(for: [expectation], timeout: 5)
        XCTAssertEqual(result, .completed)
    }
    
    func testInputId() {
        let window = app.windows["MVVM Sample"]
        
        let idTextField = window.textFields["text-field-id"]
        idTextField.tap()
        idTextField.typeText("id")

        let validationLabel = window.staticTexts["label-validation"]
        let expect = "Passwordが未入力です。"
        let predicate = NSPredicate(format: "value == %@", expect)
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: validationLabel)
        let result = XCTWaiter().wait(for: [expectation], timeout: 5)
        XCTAssertEqual(result, .completed)
    }
    
    func testInputPassword() {
        let window = app.windows["MVVM Sample"]

        let passwordTextField = window.textFields["text-field-password"]
        passwordTextField.tap()
        passwordTextField.typeText("password")
        
        let validationLabel = window.staticTexts["label-validation"]
        let expect = "IDが未入力です。"
        let predicate = NSPredicate(format: "value == %@", expect)
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: validationLabel)
        let result = XCTWaiter().wait(for: [expectation], timeout: 5)
        XCTAssertEqual(result, .completed)
    }
    
    func testInputIdAndPassword() {
        let window = app.windows["MVVM Sample"]
        
        let idTextField = window.textFields["text-field-id"]
        idTextField.tap()
        idTextField.typeText("id")

        let passwordTextField = window.textFields["text-field-password"]
        passwordTextField.tap()
        passwordTextField.typeText("password")
        
        let validationLabel = window.staticTexts["label-validation"]
        let expect = "OK!!!"
        let predicate = NSPredicate(format: "value == %@", expect)
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: validationLabel)
        let result = XCTWaiter().wait(for: [expectation], timeout: 5)
        XCTAssertEqual(result, .completed)
    }
}
