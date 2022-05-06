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
    
    var dayValue: Int?
    var startValue: Date?
    var endValue: Date?
    var startValueSend : Date?
    var endValueSend : Date?
    
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
        let getDate = sender.date
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(secondsFromGMT: +0)!
        let midnight = calendar.startOfDay(for: getDate)
        let tomorrow = calendar.date(byAdding: .day, value: 28, to: midnight)!
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "dd MMM yyyy"
        startValue = tomorrow
    }
    
    @objc func datePickerValueChanged2(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM YYYY"
        endMenstrual.text =
        formatter.string(from: sender.date)
        
        let getDate0 = sender.date
        var calendar0 = Calendar.current
        calendar0.timeZone = TimeZone(secondsFromGMT: +0)!
        let midnight0 = calendar0.startOfDay(for: getDate0)
        let tomorrow0 = calendar0.date(byAdding: .day, value: 28, to: midnight0)!
        let dateFormatter0 = DateFormatter()
        dateFormatter0.dateFormat = "dd MMM yyyy"
        endValue = tomorrow0
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
    
    func showDoubleAlert() {
        let alert = UIAlertController(title: "Day Value", message: "Day Value must be a number", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: {action in print("tapped dismiss")}))
        present(alert, animated: true)
        
    }
    
    func checkInput() -> Bool {
        let inputValue = textFilledDay.text
        if (inputValue!) != nil && (inputValue!) != "" {
            if Int(inputValue!) == nil {
                showDoubleAlert()
                return false
            }
        }
        return false

    }
    
    @IBAction func pressStart(_ sender: Any) {
        //dayValue = textFilledDay.text
        if checkInput() {
            self.dismiss(animated: true) {
                NotificationCenter.default.post(name: NSNotification.Name("updateViewMain"), object: nil, userInfo: nil)
            }
            
        }
        
        startValueSend = startValue
        endValueSend = endValue
        performSegue(withIdentifier: "toCalenderView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextPage = segue.destination as? CalenderView
        nextPage?.receivedDateDay = Int(textFilledDay.text!)
        nextPage?.receivedStartMenstrual = startValueSend
        nextPage?.receivedEndMenstrual = endValueSend
    }
    
}

