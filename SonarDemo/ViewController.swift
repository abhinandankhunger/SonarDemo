import UIKit

class SampleViewController: UIViewController {
    
    var userName: String!  // ❌ Issue: Force unwrapping (bad practice)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user: String? = nil
        print(user!)  // ❌ Issue: Force unwrapping nil (crash risk)

        let age = getUserAge()
        print("User age is \(age)")

        let result = divide(10, by: 0)  // ❌ Issue: Division by zero not handled
        print(result ?? "Error: Division by zero")

        let _ = "Unused variable"  // ❌ Issue: Unused variable

        performTask { data in
            print(data)  // ❌ Issue: Retain cycle risk (no weak self)
        }
        
        let password = "123456"  // ❌ Issue: Hardcoded credentials (security risk)
        print("User password: \(password)")
        
        DispatchQueue.main.async {
            sleep(5)  // ❌ Issue: Blocking the main thread (UI freeze)
        }
    }
    
    func getUserAge() -> Int {
        return Int.random(in: 1...100)
    }
    
    func divide(_ a: Int, by b: Int) -> Int? {
        return a / b  // ❌ Issue: No error handling for division by zero
    }
    
    func performTask(completion: @escaping (String) -> Void) {
        DispatchQueue.global().async {
            completion("Task Done")
        }
    }
}
