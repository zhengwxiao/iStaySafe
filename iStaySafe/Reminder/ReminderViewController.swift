//
//  Reminder.swift
//  iStaySafe
//
//  Created by Will Lowry on 3/29/20.
//  Copyright © 2020 Z Xiao. All rights reserved.
//

import UIKit

class ReminderViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

//    @IBOutlet weak var ReminderLabel: UILabel!
    @IBOutlet weak var HourPicker: UIPickerView!
    
    
    let hours = [ "30 Minutes", "45 Minutes", "1 Hour", "1.5 Hours", "5", "6", "7", "8", "9", "10", "11", "12" ]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, numberOfRowsInComponent component: Int) -> String? {
        return hours[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return hours.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: "some string", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return attributedString
    }
    
    // You can use this function to retrieve the input from the picker
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        label.text
//    }
        
    override func viewDidLoad() {
        setUpLabel()
        super.viewDidLoad()
    }
    
    func setUpLabel(){
        
        let string = "The CDC recommends to wash your hands frequently, especially after being in public places. Set up reoccurring reminders to wash your hands!"

        let attributedString = NSMutableAttributedString(string: string)

        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 17), range: NSRange(location: 0, length: 91))
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 17), range: NSRange(location: 91, length: 48))
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red , range: NSRange(location: 91, length: 48))

    }
    
}
