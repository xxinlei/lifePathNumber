//
//  resultVC.swift
//  lifePathNumber
//
//  Created by 楊昕蕾 on 2021/12/2.
//

import UIKit

class resultVC: UIViewController {

    var selectedDate: Date!
    @IBOutlet weak var num: UILabel!
    
    @IBOutlet weak var personalityText: UITextView!
    
    @IBOutlet weak var adviceText: UITextView!
    
    @IBOutlet weak var moon: UIImageView!
    
    @IBOutlet var stars: [UIImageView]!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sum = calculate(selectedDate)
        
        num.text = "\(sum)"
        titleLbl.text = reasult[sum-1].title
        personalityText.text = reasult[sum-1].personality
        adviceText.text = reasult[sum-1].advice

    }
    
    override func viewWillAppear(_ animated: Bool) {
        animation.twinkling(stars, duration: 1)
        animation.rotate(moon)
    }
    
    
    func calculate(_ selectedDate: Date) -> Int{
        let newFormatter = DateFormatter()
        newFormatter.dateFormat = "yyyyMMdd"
        var sum = 0
        var dateString = newFormatter.string(from: selectedDate)
        repeat{
            sum = 0
            for character in dateString {
                let number = Int(String(character))!
                sum += number
            }
            dateString = "\(sum)"
        } while sum > 9
        
        return sum

    }


}
