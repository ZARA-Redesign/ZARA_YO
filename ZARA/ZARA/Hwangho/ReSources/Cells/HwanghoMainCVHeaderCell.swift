//
//  HwanghoMainCVHeaderCell.swift
//  ZARA
//
//  Created by 송황호 on 2020/11/16.
//

import UIKit

// MARK: header Cell 관련

class HwanghoMainCVHeaderCell : UICollectionReusableView{
    
    static let identifier = "HwanghoMainCVHeaderCell"
    
    @IBOutlet weak var viewAllBtn: UIButton!
    @IBOutlet weak var coatBtn: UIButton!
    @IBOutlet weak var puffersBtn: UIButton!
    @IBOutlet weak var waistCoatsBtn: UIButton!
    @IBOutlet weak var trenchCoatBtn: UIButton!
    
    var filters = 0
    
    override func awakeFromNib() {
        viewAllBtn.setTitleColor(.red, for: .normal)
        BtnAction()
    }
    
    func BtnAction(){
        viewAllBtn.addTarget(self, action:  #selector(viewAllPressBtn), for: .touchUpInside)
        coatBtn.addTarget(self, action:  #selector(coatPressBtn), for: .touchUpInside)
        puffersBtn.addTarget(self, action:  #selector(puffersPressBtn), for: .touchUpInside)
        waistCoatsBtn.addTarget(self, action:  #selector(waistCoatsPressBtn), for: .touchUpInside)
        trenchCoatBtn.addTarget(self, action:  #selector(trenchCoatPressBtn), for: .touchUpInside)
    }
    
    func setlabel(){
        viewAllBtn.setTitleColor(.white, for: .normal)
        coatBtn.setTitleColor(.white, for: .normal)
        puffersBtn.setTitleColor(.white, for: .normal)
        waistCoatsBtn.setTitleColor(.white, for: .normal)
        trenchCoatBtn.setTitleColor(.white, for: .normal)
    }
    
    @objc func viewAllPressBtn(_ sender : UIButton) {
        filters = 0
        setlabel()
        viewAllBtn.setTitleColor(.red, for: .normal)
//        print("viewAllPressBtn 눌렀음 \(filters)")
        NotificationCenter.default.post(name: .init("viewAllPressBtn"), object: nil, userInfo: ["filter":filters])
    }
    
    @objc func coatPressBtn() {
        filters = 1
        setlabel()
        coatBtn.setTitleColor(.red, for: .normal)
//        print("coatPressBtn 눌렀음 \(filters)")
        NotificationCenter.default.post(name: .init("coatPressBtn"), object: nil, userInfo: ["filter":filters])
    }
    
    @objc func puffersPressBtn() {
        filters = 2
        setlabel()
        puffersBtn.setTitleColor(.red, for: .normal)
//        print("puffersPressBtn 눌렀음 \(filters)")
        NotificationCenter.default.post(name: .init("puffersPressBtn"), object: nil, userInfo: ["filter":filters])
    }
    
    @objc func waistCoatsPressBtn() {
        filters = 3
        setlabel()
        waistCoatsBtn.setTitleColor(.red, for: .normal)
//        print("waistCoatsPressBtn 눌렀음 \(filters)")
        NotificationCenter.default.post(name: .init("waistCoatsPressBtn"), object: nil, userInfo: ["filter":filters])
    }
    
    @objc func trenchCoatPressBtn() {
        filters = 4
        setlabel()
        trenchCoatBtn.setTitleColor(.red, for: .normal)
//        print("trenchCoatPressBtn 눌렀음 \(filters)")
        NotificationCenter.default.post(name: .init("trenchCoatPressBtn"), object: nil, userInfo: ["filter":filters])
    }
}
