//
//  ViewController.swift
//  NotificationCenterTest
//
//  Created by Mashqur Habib Himel on 7/7/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayNotificationStatus: UILabel!
    @IBOutlet weak var triggerButton: UIButton!
    @IBOutlet weak var removeButton: UIButton!

    
    func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(catchNotification), name: .notificationName , object: nil)
    }
    
    func removeObserver() {
        NotificationCenter.default.removeObserver(self, name: .notificationName, object: nil)
    }
    
    private func throwNotification() {
        NotificationCenter.default.post(name: .notificationName, object: nil)
    }
    
    @objc func catchNotification() {
        displayNotificationStatus.text = "Notification is triggered"
    }
    
    @IBAction func triggeredNotification(_ sender: UIButton) {
        addObserver()
        throwNotification()
        triggerButton.isEnabled = false
    }
    
    @IBAction func removedNotification(_ sender: UIButton) {
        removeObserver()
        triggerButton.isEnabled = true
        displayNotificationStatus.text = "Notification is off"
    }
}

extension Notification.Name {
    static let notificationName = Notification.Name("Notification")
}

