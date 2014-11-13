//
//  ViewController.swift
//  Wackathon
//
//  Created by Sean Dunford on 11/5/14.
//  Copyright (c) 2014 LuqSean. All rights reserved.
//


import UIKit
import CoreMotion


class ViewController: UIViewController {


    override func viewDidLoad() {
    super.viewDidLoad()
        println("f u sean")
        println("step counting available?", CMStepCounter.isStepCountingAvailable())
        var leCounter: CMStepCounter = CMStepCounter()
        println("stepCounter \(leCounter)")
        var start: NSDate = NSDate.distantPast() as NSDate
        var to: NSDate = NSDate.distantFuture() as NSDate
        
        func handler(steps:Int, e: NSError!) -> Void {
            println("handler \(steps)");
            println("error \(e)");

        }

        leCounter.queryStepCountStartingFrom(start, to: to, toQueue: NSOperationQueue.mainQueue(), withHandler: handler)
    }


    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }




}
