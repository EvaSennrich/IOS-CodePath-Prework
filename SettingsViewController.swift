//
//  SettingsViewController.swift
//  Prework
//
//  Created by Eva Sennrich on 1/14/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tip1: UITextField!
    @IBOutlet weak var tip2: UITextField!
    @IBOutlet weak var tip3: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        
        defaults.set(Int(tip1.text!) ?? 15, forKey: "tip1")
        defaults.set(Int(tip2.text!) ?? 18, forKey: "tip2")
        defaults.set(Int(tip3.text!) ?? 20, forKey: "tip3")
        
        defaults.synchronize()
        
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
