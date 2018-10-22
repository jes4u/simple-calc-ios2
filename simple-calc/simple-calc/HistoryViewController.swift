//
//  HistoryViewController.swift
//  simple-calc
//
//  Created by iosdev on 10/21/18.
//  Copyright © 2018 iosdev. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var historyText: UITextView!
    
    override func viewDidAppear(_ animated: Bool) {
        self.historyText.text = ""
        
        for historyItem in historyList {
            self.historyText.text = self.historyText.text + historyItem + "\n"
        }
    }
    //

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
