//
//  ViewController.swift
//  ColorSelector
//
//  Created by Andrew Merrill on 11/10/18.
//  Copyright © 2018 Andrew Merrill. All rights reserved.
//

import UIKit

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

//extension UIColor {
//    static func random() -> UIColor {
//        return UIColor(red:   .random(),
//                       green: .random(),
//                       blue:  .random(),
//                       alpha: 1.0)
//    }
//}

class ViewController: UIViewController {
    
    var redColor: Float = 1
    var greenColor: Float = 1
    var blueColor: Float = 1
    

    @IBOutlet weak var viewDrag: UIView!
    @IBOutlet weak var randomButtonColor: UIButton!
    @IBOutlet weak var backgroundButton: UIButton!
    @IBOutlet weak var redValue: UILabel!
    @IBOutlet weak var greenValue: UILabel!
    @IBOutlet weak var blueValue: UILabel!
    @IBOutlet weak var hexValue: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func changeBackgroundColor(_ sender: UIButton) {
        let randomRed: CGFloat = .random()
        redColor = Float(randomRed)
        redValue.text = String(Int(randomRed * 255))
        redSlider.value = Float(randomRed * 255)
        let randomGreen: CGFloat = .random()
        greenColor = Float(randomGreen)
        greenValue.text = String(Int(randomGreen * 255))
        greenSlider.value = Float(randomGreen * 255)
        let randomBlue: CGFloat = .random()
        blueColor = Float(randomBlue)
        blueValue.text = String(Int(randomBlue * 255))
        blueSlider.value = Float(randomBlue * 255)
        setBackgroundColor()
        
    }
    
    @IBAction func redSliderValue(_ sender: UISlider) {
        let currentVal = Int(sender.value)
        redValue.text = "\(currentVal)"
        redColor = Float(currentVal) / 255.0
        setBackgroundColor()
    }
    
    @IBAction func greenSliderValue(_ sender: UISlider) {
        let currentVal = Int(sender.value)
        greenValue.text = "\(currentVal)"
        greenColor = Float(currentVal) / 255.0
        setBackgroundColor()
    }
    
    @IBAction func blueSliderValue(_ sender: UISlider) {
        let currentVal = Int(sender.value)
        blueValue.text = "\(currentVal)"
        blueColor = Float(currentVal) / 255.0
        setBackgroundColor()
    }
    
    func setBackgroundColor() {
        self.view.backgroundColor = UIColor(red: CGFloat(redColor),
                                            green: CGFloat(greenColor),
                                            blue: CGFloat(blueColor),
                                            alpha: CGFloat(1))
        setHexValue()
    }
    
    func setHexValue() {
        hexValue.text = "#" +
            String(format:"%02X", Int(redColor * 255)) +
            String(format:"%02X", Int(greenColor * 255)) +
            String(format:"%02X", Int(blueColor * 255))

    }
    
}

