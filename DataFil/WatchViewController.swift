//
//  WatchViewController.swift
//  DataFil
//
//  Created by Alex Gubbay on 12/03/2017.
//  Copyright © 2017 Alex Gubbay. All rights reserved.
//

import UIKit

class WatchViewController: UIViewController {


    let comms = watchCommunicator.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()

        comms.start()
        // Do any additional setup after loading the view.
    }

    @IBAction func sendPushed(_ sender: Any) {
        comms.sendMessage(key: "hello", value: "hi")
        print("sent")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
