//
//  CalenderView.swift
//  MenstrualCycle
//
//  Created by Nur Mutmainnah Rahim on 28/04/22.
//

import UIKit

class CalenderView: UIViewController {
    @IBOutlet weak var dayMenstrualNow: UILabel!
    @IBOutlet weak var calender: UIDatePicker!
    @IBOutlet weak var startMenstrualEST: UITextField!
    @IBOutlet weak var endMenstrualEST: UITextField!
    
    var receivedDateDay: Int?
    var currentDate = ""
    var receivedStartMenstrual: Date?
    var receivedEndMenstrual: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if receivedDateDay == nil {
            //dayMenstrualNow.text = "kosong"
            let daysBetween = daysBetween(start: Date(), end: receivedStartMenstrual!)
            if daysBetween < 0 {
                dayMenstrualNow.text = String(-daysBetween) + " Days Late"
            }
            else {
                dayMenstrualNow.text = String(daysBetween) + " Days Left"
            }
        }
        else {
            dayMenstrualNow.text = "Day - " + String(receivedDateDay!)
        }
     

        if receivedStartMenstrual == nil {
            //startMenstrualEST.text = "belum ada"
            var calendar = Calendar.current
            // Use the following line if you want midnight UTC instead of local time
            calendar.timeZone = TimeZone(secondsFromGMT: +0)!
            let today1 = Date()
            let midnight = calendar.startOfDay(for: today1)
            let tomorrow = calendar.date(byAdding: .day, value: -receivedDateDay!, to: midnight)!
            let dateFormatter1 = DateFormatter()
            dateFormatter1.dateFormat = "dd MMM yyyy"
            startMenstrualEST.text = dateFormatter1.string(from: tomorrow)
        }
        else {
            let formatter1 = DateFormatter()
            formatter1.dateFormat = "dd MMM YYYY"
            startMenstrualEST.text = formatter1.string(from: receivedStartMenstrual!)
        }
        
        if receivedEndMenstrual == nil {
            var calendar = Calendar.current
            calendar.timeZone = TimeZone(secondsFromGMT: +0)!
            let today1 = Date()
            let midnight = calendar.startOfDay(for: today1)
            let tomorrow = calendar.date(byAdding: .day, value: 7-receivedDateDay!, to: midnight)!
            let dateFormatter1 = DateFormatter()
            dateFormatter1.dateFormat = "dd MMM yyyy"
            endMenstrualEST.text = dateFormatter1.string(from: tomorrow)
        }
        else {
            let formatter2 = DateFormatter()
            formatter2.dateFormat = "dd MMM YYYY"
            endMenstrualEST.text = formatter2.string(from: receivedEndMenstrual!)
        }
         
    }
    

    
    func daysBetween(start: Date, end: Date) -> Int {
           return Calendar.current.dateComponents([.day], from: start, to: end).day!
       }
    

}


