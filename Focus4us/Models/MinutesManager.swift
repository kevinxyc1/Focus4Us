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
        return ["Study for 20M","Take a 10M break","Continue study for 15M","Take a break for 10M","Study another 20M","You are done"]
    }
    
}
