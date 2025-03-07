//
//  ViewController.swift
//  SonarDemo
//
//  Created by Mobile Programming on 07/03/25.
//

import UIKit

class ViewController: UIViewController {
    var userName: String!  // ❌ Issue: Force unwrapping
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user: String? = nil
        print(user!)  // ❌ Issue: Force unwrapping a nil optional, can cause a crash
        
        let age = getUserAge()
        print("User age is \(age)")
        
        let result = divide(10, by: 0)  // ❌ Issue: Division by zero not handled
        print(result)
        
        let _ = "This is an unused variable"  // ❌ Issue: Unused variable
        
        performTask { data in
            print(data)  // ❌ Issue: Possible strong reference cycle
        }
    }
    
    func getUserAge() -> Int {
        return Int.random(in: 1...100)
    }
    
    func divide(_ a: Int, by b: Int) -> Int {
        return a / b  // ❌ Issue: No error handling for division by zero
    }
    
    func performTask(completion: @escaping (String) -> Void) {
        DispatchQueue.global().async {
            completion("Task Done")
        }
    }
}
