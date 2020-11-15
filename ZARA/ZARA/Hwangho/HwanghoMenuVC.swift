//
//  HwanghoMenuVC.swift
//  ZARA
//
//  Created by 송황호 on 2020/11/15.
//

import UIKit

class HwanghoMenuVC: UIViewController {

    static let identifier = "HwanghoMenuVC"

    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backPressBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
