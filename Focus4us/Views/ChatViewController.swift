//
//  ChatViewController.swift
//  Focus4us
//
//  Created by Raghav Kharbanda on 2021-01-16.
//

import UIKit

class ChatViewController: UIViewController {
    
    var timer:Timer?
    var totalSeconds = 1800

    @IBOutlet weak var timerLabelChat: UILabel!
    
    @IBAction func ChatStartButtonTapped(_ sender: Any) {
        print("button tapped")
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimerChat), userInfo: nil, repeats: true)
    }
    
    // timer what to do?
    @objc func fireTimerChat() {
        totalSeconds -= 1
        timerLabelChat.text = returnLabelChat()
        
        
    }
    
    
    func returnLabelChat() -> String{
        let mins = Int(totalSeconds/60)
        let hrs = Int(totalSeconds/3600)
        let sec = Int(totalSeconds%60)
        return "\(hrs):\(mins):\(sec)"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabelChat.text = "00:30:00"

        // Do any additional setup after loading the view.
//        let backButton = UIBarButtonItem()
//        backButton.title = "New Back Button Text"
//        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
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
