//
//  ViewController.swift
//  NotificationCenterTest
//
//  Created by Mashqur Habib Himel on 7/7/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addObserver()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        throwNotification()
    }
    
    func addObserver() {
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(catchNotification), name: .notificationName , object: nil)
    }
    
    func throwNotification() {
        NotificationCenter.default.post(name: .notificationName, object: nil)
    }
    
    @objc func catchNotification() {
        print("Notification triggered")
    }
}

extension Notification.Name {
    static let notificationName = Notification.Name("Notification")
}

