//
//  ViewController.swift
//  DataPassExamples
//
//  Created by Sumit kumar khamari on 07/03/18.
//  Copyright © 2018 Sumit kumar khamari. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, callbackFromSCNDVC {
    
    //Mark: IBoutlets
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var txtFldInput: UITextField!
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var lblObserverVal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //registering NSNotofocation Center With uniqe name
        //Better to save the key name in constant file
        NotificationCenter.default.addObserver(self, selector: #selector(didObserverTrigered) , name: .kNotificatioKeyName, object: nil)
        
    }

    //MARK: Button Actions
    @IBAction func btnNextAction(_ sender: Any) {
        //render to secondVC
        let storyBoard : UIStoryboard = UIStoryboard(name : "Main", bundle : nil)
        let secondVc  = storyBoard.instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        secondVc.recievedVal = txtFldInput.text?.count == 0 ? "No data Added" : txtFldInput.text!
        secondVc.callBack = self
        //self.present(secondVc, animated: true, completion: nil)
        self.navigationController?.pushViewController(secondVc, animated: true)
    }
    
    //MARK: TextField Delegates
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    //MARK: CallBack Methods
    func userDidSelctSomeValues(selctedValue: String, SelctedIndex: Int) {
        
        lblHeader.text = selctedValue;
        
    }
    
    //MARK: Notification Observer Methods
    @objc func didObserverTrigered(notification : Notification) -> Void {
        let dictAddedValue = notification.object as! NSDictionary
        lblObserverVal.text = dictAddedValue["Added Value"] as? String
    }
    
    //MARK: Memory Method
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

