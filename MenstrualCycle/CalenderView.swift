//
//  CalenderView.swift
//  MenstrualCycle
//
//  Created by Nur Mutmainnah Rahim on 28/04/22.
//

import UIKit

class CalenderView: UIViewController {

    @IBOutlet weak var dayMenstrualNow: UILabel!
    
    var receivedDateDay: String?
    
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
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
