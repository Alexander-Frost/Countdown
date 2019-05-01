//
//  CountdownViewController.swift
//  Countdown
//
//  Created by Alex on 5/1/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class CountdownViewController: UIViewController {

    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var timeLbl: UILabel!
    @IBOutlet var startBtn: UIButton!
    @IBOutlet var resetBtn: UIButton!
    
    @IBAction func datePickerValueChanged(_ sender: Any) {
        
        print("countdown: \(datePicker.countDownDuration)")
    }
    @IBAction func startBtnPressed(_ sender: UIButton) {
        
        let duration = datePicker.countDownDuration
        countdown.start(duration: duration)
    }
    @IBAction func resetBtnPressed(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.countDownDuration = 60
        // Do any additional setup after loading the view.
        
        countdown.delegate = self
        timeLbl.font = UIFont.monospacedDigitSystemFont(ofSize: 30, weight: .medium)
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Timer Finished", message: "Countdown Over", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default
            , handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    let countdown = Countdown()
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "HH:mm:ss.SS"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        return formatter
    }()
    
    private func updateViews(){
        let date = Date(timeIntervalSinceReferenceDate: countdown.timeRemaining)
        timeLbl.text = dateFormatter.string(from: date)  //"\(countdown.timeRemaining)"
    }
}

extension CountdownViewController: CountdownDelegate {
    func countdownDidFinish() {
        updateViews()
        print("FINISHED")
        showAlert()
    }
    
    func countdownDidUpdate(timeRemaining: TimeInterval) {
        updateViews()
    }
}
