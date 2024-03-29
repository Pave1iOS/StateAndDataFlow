//
//  ContentViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 06.03.2024.
//

import Foundation
import Observation

@Observable
final class ContentViewViewModel {
    var timerCounter = 3
    var buttonTitle = "Start"
    
    private var timer: Timer?
    
    func startTimer() {
        if timerCounter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateCounter),
                userInfo: nil,
                repeats: true
            )
        }
        
        buttonDidTapped()
    }
}

// MARK: Secondary functions
private extension ContentViewViewModel {
    
    @objc func updateCounter() {
        if timerCounter > 0 {
            timerCounter -= 1
        } else {
            killTimer()
            buttonTitle = "Reset"
        }
    }
    
    func killTimer() {
        timer?.invalidate()
        timer = nil
    }

    func buttonDidTapped() {
        if buttonTitle == "Reset" {
            timerCounter = 3
            buttonTitle = "Start"
        } else {
            buttonTitle = "Wait..."
        }
    }
}
