//
//  ViewController2.swift
//  Casale Homework #7
//
//  Created by Amy Casale on 4/29/20.
//  Copyright © 2020 Amy Casale. All rights reserved.
//

import UIKit
import WebKit
import MessageUI

class ViewController2: UIViewController, MFMessageComposeViewControllerDelegate {
    
    @IBAction func sendText(_ sender: Any) {
        
       let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        
        composeVC.recipients = ["7247574089"]
        composeVC.body = "You won't want to miss out on experiencing this amazing architecture!"
        
        if
            MFMessageComposeViewController.canSendText() {
            self.present(composeVC, animated: true, completion: nil)
        } else {
            print("Can't send text messages.")
        }
        
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
    
    }
    
    
    
    @IBOutlet weak var webView: WKWebView!
    @IBAction func openWebsite(_ sender: Any) {
        
        if let url = URL(string: "https://parcocolosseo.it/area/colosseo/") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let myURL = URL(string: "https://parcocolosseo.it/area/colosseo/")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
        
 
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
