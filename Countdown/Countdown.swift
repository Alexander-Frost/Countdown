//
//  Countdown.swift
//  Countdown
//
//  Created by Alex on 5/1/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import Foundation

protocol CountdownDelegate: AnyObject{
    func countdownDidUpdate(timeRemaining: TimeInterval)
    func countdownDidFinish()
}


class Countdown {
    
    
    init(duration: TimeInterval = 60) {
        self.duration = duration
        self.timeRemaining = duration
    }
    
    func start(duration: TimeInterval){
        self.duration = duration
        self.timeRemaining = duration
        
        stopDate = Date(timeIntervalSinceNow: duration)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update(timer:)), userInfo: nil, repeats: true)
    }
    
    @objc func update(timer: Timer){
        if let stopDate = stopDate {
            let currentTime = Date()
            
            if currentTime <= stopDate {
                
                
                timeRemaining = stopDate.timeIntervalSince(currentTime)
                print("Time remaining: \(timeRemaining)")
                delegate?.countdownDidUpdate(timeRemaining: timeRemaining)
                
            } else {
                clearTimer()
                delegate?.countdownDidFinish()
                reset()
            }
        }
    }
    
    func stop(){
        stopDate = nil
        
    }
    
    func reset(){
        stopDate = nil
    }
    
    
    private func clearTimer(){
        timer?.invalidate()
        timer = nil
    }
    
    var timer: Timer?
    var startDate: Date?
    var stopDate: Date?
    var timeRemaining: TimeInterval // number of seconds (Double)
    var duration: TimeInterval
    weak var delegate: CountdownDelegate?
}
