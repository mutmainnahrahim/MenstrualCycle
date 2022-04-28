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
    @IBOutlet weak var startMenstrual: UIView!
    @IBOutlet weak var endMenstrual: UIView!
    
    var dayValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        switchYesNo.isOn = false
        labelLastMenstrual.isHidden = false
        textFilledDay.isHidden = true
        startMenstrual.isHidden = false
        endMenstrual.isHidden = false
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
        performSegue(withIdentifier: "toCalenderView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextPage = segue.destination as? CalenderView
        nextPage?.receivedDateDay = dayValue
    }
    
}

