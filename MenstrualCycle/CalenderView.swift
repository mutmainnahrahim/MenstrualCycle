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
    
    var receivedDateDay: String?
    var currentDate = ""
    var receivedStartMenstrual: String?
    var receivedEndMenstrual: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startMenstrualEST.text = receivedStartMenstrual
        endMenstrualEST.text = receivedEndMenstrual
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
        
    }
    

}
