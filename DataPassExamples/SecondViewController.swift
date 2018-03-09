//
//  SecondViewController.swift
//  DataPassExamples
//
//  Created by Sumit kumar khamari on 07/03/18.
//  Copyright © 2018 Sumit kumar khamari. All rights reserved.
//

import UIKit

protocol callbackFromSCNDVC : AnyObject {
    
    func userDidSelctSomeValues(selctedValue : String, SelctedIndex : Int)
    
    
}

class SecondViewController: UIViewController {
    
    weak var callBack : callbackFromSCNDVC? = nil
    
    
    //Mark: IBOutlets
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var lblValue: UILabel!
    var recievedVal = ""
    
    //MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblValue.text = recievedVal
    }
    
    //MARK: Button Actions
    @IBAction func btnSecondVCAction(_ sender: UIButton) {
        
        let btnTag = sender.tag - 1000
        //pop to prevois VC with Selcted Data
        //in objective c we have to write a lot of code for this

        switch btnTag {
        case 0:
            callBack?.userDidSelctSomeValues(selctedValue: "First button selected", SelctedIndex: btnTag)
            break
        case 1:
            callBack?.userDidSelctSomeValues(selctedValue: "Second button selected", SelctedIndex: btnTag)
            break
        case 2:
            break
            callBack?.userDidSelctSomeValues(selctedValue: "Third button selected", SelctedIndex: btnTag)
        default:
            break
        }
        //_ = self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnNextAction(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name : "Main", bundle : nil)
        let thirdVC = storyBoard.instantiateViewController(withIdentifier: "ThirdVC") as! ThirdViewController
        self.present(thirdVC, animated: true, completion: nil)
        //self.navigationController?.pushViewController(thirdVC, animated: true)
        
        
    }
    //MARK: Memory Methods
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
