//
//  ViewController.swift
//  nestedLoopPractice
//
//  Created by BettyPan on 2021/1/8.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var shapeSegment: UISegmentedControl!
    @IBOutlet weak var appleSlider: UISlider!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var appleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func changeShape(_ sender: UISegmentedControl) {
        //設定初始，每次切換形狀都由1開始
        sliderValueLabel.text = "1"
        appleSlider.value = 1
        appleLabel.text = "🍎"
        
        if sender.selectedSegmentIndex == 3||sender.selectedSegmentIndex == 4{
            appleLabel.textAlignment = .left
        }else{
            appleLabel.textAlignment = .center
        }
    }
    
    @IBAction func changeAppleAmount(_ sender: UISlider) {
        sender.value.round()
        //設欲加入蘋果之內文
        var content = ""
        //設slider的數字為整數(蘋果數量)
        let number = Int(sender.value.rounded())
        sliderValueLabel.text = " \(number)"
        
        //當segment為0（正方形）
        if shapeSegment.selectedSegmentIndex == 0 {
        for _ in 1...number {
            for _ in 1...number {
                content = content + "🍎"
            }
            content = content + "\n"
        }
            
        //當segment為1（三角形）
        }else if shapeSegment.selectedSegmentIndex == 1 {
            for i in 1...number {
                for _ in 1...i{
                    content = content + "🍎"
                }
                content = content + "\n"
              
            }
        //當segment為2（倒三角形）
        }else if shapeSegment.selectedSegmentIndex == 2 {
            for i in 1...number {
                for _ in i...number {
                    content = content + "🍎"
                }
                content = content + "\n"
            }
        //當segment為3（菱形）
        }else if shapeSegment.selectedSegmentIndex == 3 {
            var redApple = number - 1
            var greenApple = 1
            
            for i in 1...number*2-1 {
                for _ in 0..<redApple {
                    content = content + "🍎"
                }
                for _ in 1...greenApple {
                    content = content + "🍏"
                }
                if i < number {
                    redApple = redApple - 1
                    greenApple = greenApple + 2
                }else{
                    redApple = redApple + 1
                    greenApple = greenApple - 2
                }
                content = content + "\n"
            }
            
        //當segment為其他（金字塔）
        }else{
            for i in 1...number {
                for _ in i..<number {
                    content = content + "🍏"
                }
                let number2 = i * 2 - 1
                for _ in 1...number2 {
                    content = content + "🍎"
                }
            content = content + "\n"
}
}
        appleLabel.text = content

}
}
