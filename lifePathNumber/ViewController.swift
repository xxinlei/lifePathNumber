//
//  ViewController.swift
//  lifePathNumber
//
//  Created by 楊昕蕾 on 2021/12/2.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var birthday: UITextField!
    @IBOutlet var stars: [UIImageView]!
    
    let datepicker = UIDatePicker()
    let formatter = DateFormatter()
    let toolbar = UIToolbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animation.twinkling(stars, duration: 1)
    
        formatter.dateStyle = .medium
        formatter.locale = Locale(identifier: "zh_Hant_CN")
        datepicker.datePickerMode = .date
        datepicker.preferredDatePickerStyle = .wheels
        datepicker.maximumDate = Date()
        datepicker.locale = Locale(identifier: "zh_Hant_CN")
        datepicker.customDatepicker(bgColor: UIColor(red: 210/255, green: 214/255, blue: 218/255, alpha: 1), fontColor: UIColor(red: 1/255, green: 29/255, blue: 40/255, alpha: 1))
        //target:觸發事件時要呼叫的目標 action:呼叫的目標要執行什麼方法 for:觸發的事件
        datepicker.addTarget(self, action: #selector(datePickerChanged(sender:)), for: UIControl.Event.valueChanged)
        birthday.textAlignment = .center
        birthday.text = formatter.string(from: datepicker.date)
        birthday.inputView = datepicker
        
        toolbar.sizeToFit()
        toolbar.barTintColor = UIColor(red: 210/255, green: 214/255, blue: 218/255, alpha: 1)
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneBtnPressed))
        doneBtn.tintColor = UIColor(red: 2/255, green: 43/255, blue: 60/255, alpha: 1)
        toolbar.setItems([doneBtn], animated: true)
        birthday.inputAccessoryView = toolbar

    }
  
    
    @objc func datePickerChanged(sender: UIDatePicker){
        birthday.text = formatter.string(from: sender.date)

    }
    
    @objc func doneBtnPressed() {
        birthday.text = formatter.string(from: datepicker.date)
        self.view.endEditing(true)
    }
    
    
        
    @IBSegueAction func show(_ coder: NSCoder) -> resultVC? {
        let resultViewController = resultVC(coder: coder)
        resultViewController?.selectedDate = datepicker.date
        return resultViewController
    }
    
    @IBAction func unwindSegueBack(segue: UIStoryboardSegue){
        
    }
}

extension UIDatePicker {
    
    func customDatepicker(bgColor: UIColor, fontColor: UIColor){
    //datePicker的背景顏色
    self.backgroundColor = bgColor
    //設置datePicker的字體顏色
    self.setValue(fontColor, forKey: "textColor")
    //highlightsToday設為false，否則datePicker上今天的日期字色不會被改變
    self.setValue(false, forKey: "HighlightsToday")
}
}


