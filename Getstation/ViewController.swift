//
//  ViewController.swift
//  Getstation
//
//  Created by Aaron Addleman on 8/22/15.
//  Copyright (c) 2015 Aaron Addleman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var textIpAddressBox: UITextField!
    
    @IBOutlet weak var textResultsBox: UITextView!

    @IBAction func handleSendPingButtonTapped(sender: UIButton) {
        
        let urlPath: String = "http://" + self.textIpAddressBox.text
        var url: NSURL = NSURL(string: urlPath)!
        var request: NSURLRequest = NSURLRequest(URL: url)
        var response: NSURLResponse?
        
        var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: nil) as NSData?
        
        if let httpResponse = response as? NSHTTPURLResponse {
            println("error \(httpResponse.statusCode)")
            textResultsBox.text = "\(httpResponse)"
        }
    }

}

