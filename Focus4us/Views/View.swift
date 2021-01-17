//
//  View.swift
//  Focus4us
//
//  Created by Kevin Xu on 2021-01-17.
//

import UIKit

class View: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    
    var timer:Timer?
    var totalSeconds = 1800

    
    @IBAction func StartButtonTapped(_ sender: UIButton) {
        print("button tapped")
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func PauseButtonTapped(_ sender: Any) {
        if self.timer != nil{
            self.timer!.invalidate()
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabel.text = "00:30:00"
        
        // Do any additional setup after loading the view.
    }
    
    // timer what to do?
    @objc func fireTimer() {
        totalSeconds -= 1
        timerLabel.text = returnLabel()
        
        
    }
    
    
    func returnLabel() -> String{
        let mins = Int(totalSeconds/60)
        let hrs = Int(totalSeconds/3600)
        let sec = Int(totalSeconds%60)
        return "\(hrs):\(mins):\(sec)"
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
