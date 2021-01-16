//
//  ViewController.swift
//  Focus4us
//
//  Created by Raghav Kharbanda on 2021-01-16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sliderView: UIView!
    @IBOutlet weak var timelabel: UILabel!
    @IBOutlet weak var calcButon: UIButton!
    
    // function to get slider values
    func GetTimeVal(val: Float) -> String{
        let timeArr = [30,60,90,120,150,180,210,240,270,300,330,360]
        let time = Int((val/100)*11)
        let val1 = timeArr[time]
        let hrs = Int(val1/60)
        let min = Int(val1%60)
        if hrs == 0 { return "\(min) M"}
        else { return "\(hrs) H \(min) M"}
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CODE FOR SLIDER
        //---------------------------------------------------------------------------------------------
        // init slider view
        let frame = CGRect(x: 0, y:0, width: sliderView.frame.width, height: sliderView.frame.height)
        let circularSlider = CircularSlider(frame: frame)
        
        // setup target to watch for value change
        circularSlider.addTarget(self, action: #selector(ViewController.valueChanged(_:)), for: UIControl.Event.valueChanged)
        
        // NOTE: sliderMaximumAngle must be set before currentValue
        circularSlider.maximumAngle = 270.0
        circularSlider.unfilledArcLineCap = .round
        circularSlider.filledArcLineCap = .round
        circularSlider.currentValue = 10
        circularSlider.lineWidth = 30
        circularSlider.filledColor = UIColor(red: 15.0/255, green: 76.0/255, blue: 129.0/255, alpha: 1.0)
        circularSlider.unfilledColor = UIColor(red: 146.0/255, green: 176.0/255, blue: 193.0/255, alpha: 1.0)
        // add to view
        sliderView.addSubview(circularSlider)
        // NOTE: create and set a transform to rotate the arc so the white space is centered at the bottom
        circularSlider.transform = circularSlider.getRotationalTransform()
        //---------------------------------------------------------------------------------------------
        
    }
    
    // SLIDER TRIGGER FUNCTION
    @objc func valueChanged(_ slider: CircularSlider) {
        timelabel.text = GetTimeVal(val: slider.currentValue)
    }


}

