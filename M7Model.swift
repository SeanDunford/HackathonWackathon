//
//  M7Model.swift
//  Wackathon
//
//  Created by Sean Dunford on 11/10/14.
//  Copyright (c) 2014 LuqSean. All rights reserved.
//

import Foundation
import CoreMotion

extension NSDate{
    class func now() -> NSDate{
        return NSDate()
    }
    class func tenMinutesAgo() -> NSDate{
        return NSDate(timeIntervalSinceNow: -(10 * 60))
    }
}

class M7Model: NSObject {
    var steps: NSNumber = 0
    var pedometer: CMPedometer = CMPedometer()
    var stepCounter: CMStepCounter = CMStepCounter()
    var stepsToday: NSInteger = -1
    var stepsSinceAlive: NSInteger = 0
    var isLiveCounting: Bool  = false
    var stepQ: NSOperationQueue = NSOperationQueue()
    var noteCenter: NSNotificationCenter = NSNotificationCenter.defaultCenter()
    
    
    override init(){
        super.init()
        
        var pedometer = CMPedometer()
        if CMPedometer.isFloorCountingAvailable(){
            pedometer.queryPedometerDataFromDate(NSDate.tenMinutesAgo(),
                toDate: NSDate.now(),
                withHandler: {(data: CMPedometerData!, error: NSError!) in
                    println("Floors ascended = \(data.floorsAscended)")
                    println("Floors descended = \(data.floorsAscended)")
                    println("Steps taken = \(data.numberOfSteps)")
            })
            
        } else {
            println("Floor counting is not available")
        }
        
        if CMPedometer.isStepCountingAvailable(){
            
            
        }
    }
}
