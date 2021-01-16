//
//  ViewController.swift
//  Focus4us
//
//  Created by Raghav Kharbanda on 2021-01-16.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

    @IBOutlet weak var sliderView: UIView!
    @IBOutlet weak var timelabel: UILabel!
    @IBOutlet weak var calcButon: UIButton!
    @IBOutlet weak var planView: UIView!
    
    // this manages the minutes
    var minutesManager = MinutesManager()
    
    // Variables for appearing time
    let buttonPadding:CGFloat = 10
    var xOffset:CGFloat = 10
    var scView:UIScrollView?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Calculate button color
        calcButon.setTitleColor(UIColor(red: 15.0/255, green: 76.0/255, blue: 129.0/255, alpha: 1.0), for: .normal)
        
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
        
        scView = UIScrollView(frame: CGRect(x: 0, y: 30, width: view.bounds.width, height: 250))
        planView.addSubview(scView!)
        scView!.backgroundColor = UIColor.clear
            scView!.translatesAutoresizingMaskIntoConstraints = false

            
        
        
        
        
        
        
    }
    
    // SLIDER TRIGGER FUNCTION
    @objc func valueChanged(_ slider: CircularSlider) {
        timelabel.text = minutesManager.GetTimeVal(val: slider.currentValue)
    }

    
    // When button is pressed to calculate time
    @IBAction func CalcTime(_ sender: UIButton) {
        
//        planView.subviews.forEach({ $0.removeFromSuperview() })
        scView = UIScrollView(frame: CGRect(x: 0, y: 30, width: view.bounds.width, height: 250))
        planView.addSubview(scView!)
        scView!.backgroundColor = UIColor.clear
            scView!.translatesAutoresizingMaskIntoConstraints = false
        
        // change the name of the button
        calcButon.setTitle("Calculate Again", for: .normal)
        
        let arr = minutesManager.GetArr()
        print(arr.count)
        
        for i in 0 ... arr.count-1 {
            let card = UILabel()
            card.tag = i
            card.backgroundColor = UIColor(red: 233.0/255, green: 244.0/255, blue: 255.0/255, alpha: 1.0)
            card.text = arr[i]
            card.font = UIFont(name: "Futura", size: 20)
            card.layer.cornerRadius = 20
            card.textColor = UIColor(red: 1.0/255, green: 46.0/255, blue: 84.0/255, alpha: 1.0)
            card.layer.masksToBounds = true
            card.textAlignment = NSTextAlignment.center;
            card.numberOfLines = 0
            //button.addTarget(self, action: #selector(btnTouch), for: UIControlEvents.touchUpInside)

            card.frame = CGRect(x: xOffset, y: CGFloat(buttonPadding), width: 90, height: 160.0)

            xOffset = xOffset + CGFloat(buttonPadding) + card.frame.size.width
            scView!.addSubview(card)


        }
       scView!.contentSize = CGSize(width: xOffset, height: scView!.frame.height)
        
        
    }
    
}

