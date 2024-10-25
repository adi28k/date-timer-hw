//
//  ViewController.swift
//  Timer HW
//
//  Created by Adilet Kistaubayev on 23.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var startDatePicker: UIDatePicker!
    
    @IBOutlet weak var endDatePicker: UIDatePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSecondViewController" {
            if let secondVC = segue.destination as? SecondViewController {
                secondVC.startDate = startDatePicker.date
                secondVC.endDate = endDatePicker.date
            
            }
        }
            
        }
    
}
