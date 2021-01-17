//
//  MinutesManager.swift
//  Focus4us
//
//  Created by Raghav Kharbanda on 2021-01-16.
//

import Foundation

struct MinutesManager{
    
    var currentMinuts = 0
    
    // function to get slider values
    mutating func GetTimeVal(val: Float) -> String{
        let timeArr = [30,60,90,120,150,180,210,240,270,300,330,360]
        let time = Int((val/100)*11)
        self.currentMinuts = timeArr[time]
        let hrs = Int(self.currentMinuts/60)
        let min = Int(self.currentMinuts%60)
        if hrs == 0 { return "\(min) M"}
        else { return "\(hrs) H \(min) M"}
        
    }
    
    func GetArr() -> [String]{
        if (currentMinuts == 30) {
            return ["Study for 30M"]
        } else if (currentMinuts == 60){
            return ["Study for 30M", "Break for 2M","Study for 28M"]
        } else if (currentMinuts == 90){
            return ["Study for 30M", "Break for 2M","Study for 28M", "Study for 30M", "Break for 2M","Study for 28M"]
        } else if (currentMinuts == 120){
            return ["Study for 30M", "Break for 5M","Study for 30M","Break for 10M", "Study for 45M"]
        } else if (currentMinuts == 150){
            return ["Study for 30M", "Break for 2M","Study for 35M","Break for 3M","Study for 30M","Break for 10M","Study for 40M"]
        } else if (currentMinuts == 180){
            return ["Study for 30M", "Break for 2M","Study for 35M","Break for 3M","Study for 40M", "Break for 5M","Study for 30M","Break for 5M","Study for 30M"]
        } else {
            return ["Study for 30M", "Break for 2M","Study for 35M","Break for 3M","Study for 40M", "Break for 5M","Study for 30M","Break for 5M","Study for 30M","Break for 5M","Study for 25M"]
        }
        
    }
    
}
