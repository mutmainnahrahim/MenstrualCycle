//
//  ViewController.swift
//  MenstrualCycle
//
//  Created by Nur Mutmainnah Rahim on 27/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchYesNo: UISwitch!
    @IBOutlet weak var labelLastMenstrual: UILabel!
    @IBOutlet weak var textFilledDay: UITextField!
    @IBOutlet weak var startMenstrual: UITextField!
    @IBOutlet weak var endMenstrual: UITextField!
    
    var dayValue: String?
    var startValue: String?
    var endValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        switchYesNo.isOn = false
        labelLastMenstrual.isHidden = false
        textFilledDay.isHidden = true
        startMenstrual.isHidden = false
        endMenstrual.isHidden = false
        let date1 = Date()
        let date2 = Date()
        let formatter1 = DateFormatter()
        let formatter2 = DateFormatter()
        formatter1.dateFormat = "dd MMM YYYY"
        formatter2.dateFormat = "dd MMM YYYY"
        startMenstrual.text =
        formatter1.string(from: date1)
        endMenstrual.text =
        formatter2.string(from: date2)
        
        
        
        let datePicker1 = UIDatePicker()
        let datePicker2 = UIDatePicker()
        datePicker1.datePickerMode = .date
        datePicker2.datePickerMode = .date
        datePicker1.addTarget(self, action: #selector(datePickerValueChanged1(sender:)), for:UIControl.Event.valueChanged)
        datePicker2.addTarget(self, action: #selector(datePickerValueChanged2(sender:)), for:UIControl.Event.valueChanged)
        startMenstrual.inputView = datePicker1
        endMenstrual.inputView = datePicker2
        
    }
                             
    @objc func datePickerValueChanged1(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM YYYY"
        startMenstrual.text =
        formatter.string(from: sender.date)
    }
    
    @objc func datePickerValueChanged2(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM YYYY"
        endMenstrual.text =
        formatter.string(from: sender.date)
    }
   
    @IBAction func switchChange(_ sender: Any) {
        if switchYesNo.isOn {
            labelLastMenstrual.isHidden = true
            textFilledDay.isHidden = false
            startMenstrual.isHidden = true
            endMenstrual.isHidden = true
        }
        else {
            textFilledDay.isHidden = true
            labelLastMenstrual.isHidden = false
            startMenstrual.isHidden = false
            endMenstrual.isHidden = false
        }
    }
    
    @IBAction func pressStart(_ sender: Any) {
        dayValue = textFilledDay.text
        startValue = startMenstrual.text
        endValue = endMenstrual.text
        performSegue(withIdentifier: "toCalenderView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextPage = segue.destination as? CalenderView
        nextPage?.receivedDateDay = dayValue
        nextPage?.receivedStartMenstrual = startValue
        nextPage?.receivedEndMenstrual = endValue
    }
    
}

