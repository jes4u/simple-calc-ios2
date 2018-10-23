//
//  ViewController.swift
//  simple-calc
//
//  Created by iosdev on 10/16/18.
//  Copyright © 2018 iosdev. All rights reserved.
//

import UIKit

var historyList = [String]()

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    var recorder: [String] = []
    
    @IBAction func numbers(_ sender: Any) {
        let value = String((sender as AnyObject).tag - 1)
        if self.display.text == " 0" {
            self.display.text = " " + value;
        } else {
            self.display.text = self.display.text! + " " + value;
        }
        self.recorder.append(value)
    }
    
    @IBAction func clear(_ sender: Any) {
        self.display.text = " 0";
        self.recorder.removeAll()
    }
    
    @IBAction func add(_ sender: Any) {
        self.display.text = self.display.text! + " +"
        self.recorder.append("+")
    }
    
    @IBAction func subtract(_ sender: Any) {
        self.display.text = self.display.text! + " -"
        self.recorder.append("-")

    }
    
    @IBAction func multiply(_ sender: Any) {
        self.display.text = self.display.text! + " *"
        self.recorder.append("*")
    }
    
    @IBAction func divide(_ sender: Any) {
        self.display.text = self.display.text! + " /"
        self.recorder.append("/")
    }
    
    @IBAction func mod(_ sender: Any) {
        self.display.text = self.display.text! + " %"
        self.recorder.append("%")
    }
    
    @IBAction func factorial(_ sender: Any) {
        self.display.text = self.display.text! + " fact"
        self.recorder.append("fact")
    }
    
    @IBAction func average(_ sender: Any) {
        self.display.text = self.display.text! + " avg"
        self.recorder.append("avg")
    }
    
    @IBAction func count(_ sender: Any) {
        self.display.text = self.display.text! + " count"
        self.recorder.append("count")
    }
    
    @IBAction func result(_ sender: Any) {
        var wholeProblem = self.display.text! + " = "
        self.recorder.append("end")
        self.display.text = ""
        var count = 1
        //var indexCount = 0
        var firstValue = ""
        var secondValue = ""
        var opp = ""
        var isAvg = false
        var integerCount = 1
        
        for index in self.recorder {
            
            var isOpp = false
            if index == "+" ||
                index == "-" ||
                index == "*" ||
                index == "/" ||
                index == "%" ||
                index == "count" ||
                index == "avg" ||
                index == "fact" ||
                index == "end"{
                
                isOpp = true
            }
            
            if isOpp && opp != "" {
                
                if opp == "count" {
                    count = count  + 1
                    self.display.text = String(count)
                    wholeProblem = wholeProblem + String(count)
                } else if (opp == "end") && isAvg {
                    
                    let avgTotal = Int(firstValue)! / integerCount
                    self.display.text = String(avgTotal)
                    firstValue = String(avgTotal)
                    wholeProblem = wholeProblem + String(avgTotal)
                    
                } else if opp == "avg" {
                    integerCount = integerCount + 1
                    isAvg = true
                    let val = calc(firstValue, secondValue, "+")
                    firstValue = String(val)
                    self.display.text = self.display.text! + "hi"
                } else {
                    
                    let ans = calc(firstValue, secondValue, opp)
                    self.display.text = String(ans)
                    firstValue = String(ans)
                    wholeProblem = wholeProblem + String(ans)
                    
                }
                secondValue = ""
                opp = index
            } else if isOpp && opp == "" {
                opp = index
                if index == "fact" {
                    let ans = calc(firstValue, "", "fact")
                    self.display.text = String(ans)
                    firstValue = String(ans)
                    secondValue = ""
                    opp = ""
                }
                
            } else if !isOpp && opp == ""{
                //self.display.text = self.display.text! + "hi" + index
                firstValue = firstValue + index
            } else {
                //self.display.text = self.display.text! + "boo" + index
                secondValue = secondValue + index
            }
            
        }
        
        historyList.append(wholeProblem)
        self.recorder.removeAll()
        self.recorder.append(self.display.text!)
        
    }
    
    func calc(_ firstValue: String, _ secondValue: String, _ opp:String) -> Int {
        if opp == "+" {
            return Int(firstValue)! + Int(secondValue)!
        } else if opp == "-" {
            return Int(firstValue)! - Int(secondValue)!
        } else if opp == "*" {
            return Int(firstValue)! * Int(secondValue)!
        } else if opp == "/" {
            return Int(firstValue)! / Int(secondValue)!
        } else if opp == "%" {
            return Int(firstValue)! % Int(secondValue)!
        } else {
            var total = 1;
            if (firstValue) == "0" || (firstValue) == "1" {
                total = 1;
            } else {
                for index in 1...Int(firstValue)! {
                    total *= index;
                }
            }
            return total
            
        }
//        else { //opp = avg
//            return Int(firstValue)! + Int(secondValue)!
//        }
    }
    
    @IBAction func history(_ sender: Any) {
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    

    
    
}

