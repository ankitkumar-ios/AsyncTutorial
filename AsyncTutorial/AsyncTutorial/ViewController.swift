//
//  ViewController.swift
//  AsyncTutorial
//
//  Created by Ankit Kumar on 27/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    var status = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loadData()
        loadDataNew()
    }
}

// MARK: - With Closure
extension ViewController {
    func loadData() {
        serviceClass { bool in
            print("status = \(bool)")
        }
    }
    
    func serviceClass(completion: @escaping (Bool) -> Void) {
        apiCall(completion: completion)
    }
    
    func apiCall(completion: @escaping (Bool) -> Void) {
        completion(Bool.random())
    }
}

// MARK: - With Async
extension ViewController {
    func loadDataNew() {
        Task {
            self.status = await serviceCallNew()
            print("status new = \(self.status)")
        }
    }
    
    func serviceCallNew() async -> Bool {
        await apiCallNew()
    }
    
    func apiCallNew() async -> Bool {
        Bool.random()
    }
}

// MARK: - Async with closure
extension ViewController {
    func loadDataWithClosure() {
        Task {
            self.status = await serviceCallClosure()
        }
    }
    
    func serviceCallClosure() async -> Bool {
        await withCheckedContinuation({ continuation in
            apiCall { value in
                continuation.resume(returning: value)
            }
        })
    }
    

}
