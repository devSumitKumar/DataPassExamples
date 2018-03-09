//
//  ThirdViewController.swift
//  DataPassExamples
//
//  Created by Polosoft on 08/03/18.
//  Copyright © 2018 Sumit kumar khamari. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var txtFldInput: UITextField!
    //MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: Button Actions
    @IBAction func btnSubmitAction(_ sender: Any) {
        let strAddedVal : String = txtFldInput.text?.count == 0 ? "No data Added":txtFldInput.text!
        let dictInputValue : [String : String] = ["Added Value" : strAddedVal]
        
        NotificationCenter.default.post(name: .kNotificatioKeyName , object: dictInputValue)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: TextField Delegates
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: Memory Method
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
