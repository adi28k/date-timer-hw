//
//  SecondViewController.swift
//  Timer HW
//
//  Created by Adilet Kistaubayev on 23.10.2024.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var timerDatePicker: UIDatePicker!
    
    var startDate: Date?
    var endDate: Date?
    
    var countdownTimer: Timer?
    var currentCountdownDate: Date?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let startDate = startDate {
            startDatePicker.date = startDate
            currentCountdownDate = startDate
        }
        if let endDate = endDate {
            endDatePicker.date = endDate
        }
        
        timerDatePicker.datePickerMode = .dateAndTime
        timerDatePicker.date = currentCountdownDate ?? Date()
        
    }
    
    
    func startTimer() {
        countdownTimer?.invalidate()
        countdownTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.updateCountdown()
        }
    }
    
    func pauseTimer() {
        countdownTimer?.invalidate()
    }
    
    func resetTimer() {
        pauseTimer()
        currentCountdownDate = startDate
        timerDatePicker.date = currentCountdownDate ?? Date()
    }
    
    
    func updateCountdown() {
        guard let endDate = endDate else { return }
        
        if let currentDate = currentCountdownDate, currentDate < endDate {
            
            let nextDate = currentDate.addingTimeInterval(43200)
            
            
            if nextDate >= endDate {
                currentCountdownDate = endDate
                countdownTimer?.invalidate()
            } else {
                currentCountdownDate = nextDate
            }
            
            timerDatePicker.date = currentCountdownDate ?? Date()
        } else {
            
            countdownTimer?.invalidate()
        }
    }
    
    
    
    @IBAction func playTimer(_ sender: Any) {
        startTimer()
    }
    
    
    @IBAction func stopTimer(_ sender: Any) {
        pauseTimer()
    }
    
    
    @IBAction func restartTimer(_ sender: Any) {
        resetTimer()
    }
    
    
}
        
    
