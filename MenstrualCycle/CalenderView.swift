//
//  CalenderView.swift
//  MenstrualCycle
//
//  Created by Nur Mutmainnah Rahim on 28/04/22.
//

import UIKit

class CalenderView: UIViewController {
    var receivedDateDay: String?
    @IBOutlet weak var dayMenstrualNow: UILabel!
    @IBOutlet weak var calender: UIDatePicker!
    @IBOutlet weak var startMenstrualEST: UITextField!
    @IBOutlet weak var endMenstrualEST: UITextField!
    
    //var receivedDateDay: String?
    var currentDate = ""
    var receivedStartMenstrual: String?
    var receivedEndMenstrual: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTodaysDate()
        // Do any additional setup after loading the view.
        //print(receivedDateDay)
        if receivedDateDay == "" {
            dayMenstrualNow.text = "kosong"
        }
        else {
            dayMenstrualNow.text = "Day - " + receivedDateDay!
        }
        
        if receivedStartMenstrual == currentDate {
            startMenstrualEST.text = "belum ada"
        }
        else {
            startMenstrualEST.text = receivedStartMenstrual
        }
        
        if receivedEndMenstrual == currentDate {
            endMenstrualEST.text = "belum ada"
        }
        else {
            endMenstrualEST.text = receivedEndMenstrual
        }
    }
    
    func getTodaysDate() {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let today = dateFormatter.string(from: date)
        currentDate = today
        
        var calendar = Calendar.current
        // Use the following line if you want midnight UTC instead of local time
        calendar.timeZone = TimeZone(secondsFromGMT: +0)!
        let today1 = Date()
        let midnight = calendar.startOfDay(for: today1)
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: midnight)!
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "dd MMM yyyy"
        print(dateFormatter1.string(from: tomorrow))
    }
   /*
    func getStartDate() {
        let dateFormatterStart = DateFormatter()
        dateFormatterStart.dateFormat = "dd MMM yyy"
        let startEST = dateFormatterStart.string(from: receivedStartMenstrual)

    }
   */
    

    

}
