//
//  ViewController.swift
//  Message
//
//  Created by gandrey on 24/04/2020.
//  Copyright © 2020 GlAndrey. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController {

    
    var messageController = MFMessageComposeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pushSendMessageAction(_ sender: Any) {
        if MFMessageComposeViewController.canSendText() {
            print("canSendText")
            return
        }
        messageController.recipients = ["+79161066139", "g4andrey@gmail.com"]
        messageController.body = "Не хочу быть телефоном, хочу быть тамогочей"
        
        messageController.messageComposeDelegate = self
        
        present(messageController, animated: true, completion: nil)
    }
    
}


extension ViewController: MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
        
        switch result {
        case MessageComposeResult.cancelled:
            print("Message cancelled")
        case MessageComposeResult.sent:
            print("Message sent")
        case MessageComposeResult.failed:
            print("Message failed")
        default:
            print("Default Action")
        }
        
        
    }

}

