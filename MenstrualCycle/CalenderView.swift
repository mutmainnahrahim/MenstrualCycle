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
    
    var receivedDateDay: String?
    var currentDate = ""
    var receivedStartMenstrual: String?
    var receivedEndMenstrual: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //print(receivedDateDay)
        if receivedDateDay == "" {
            dayMenstrualNow.text = "kosong"
        }
        else {
            dayMenstrualNow.text = receivedDateDay
        }
    }
 /*
    @IBAction func calenderPick(_ sender: Any) {
        let datestyle = DateFormatter()
        datestyle.timeZone = TimeZone(abbreviation: "GMT+7")
        datestyle.locale = NSLocale.current
        datestyle.dateFormat = "dd MMMM, yyyy"
        let date = datestyle.string(from: calender.date)
        currentDate = date
    }
  */
    
    func getTodaysDate() {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let today = dateFormatter.string(from: date)
        
        currentDate = today
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
