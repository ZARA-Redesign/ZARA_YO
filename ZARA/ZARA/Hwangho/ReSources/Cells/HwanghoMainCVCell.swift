//
//  HwanghoMainCVCell.swift
//  ZARA
//
//  Created by 송황호 on 2020/11/16.
//

import UIKit

class HwanghoMainCVCell: UICollectionViewCell {
    static let identifier = "HwanghoMainCVCell"
    
    @IBOutlet weak var dressImg: UIImageView!
    @IBOutlet weak var productTx: UILabel!
    @IBOutlet weak var nameTx: UILabel!
    @IBOutlet weak var orginPriceTx: UILabel!
    @IBOutlet weak var salePriceTx: UILabel!
    
    var filter : Int?
    
    func setInformation(image: String, product: String, name: String, originalPrice : Int, salePrice: Int, filter: Int){
        self.dressImg.image = UIImage(named: image)
        self.productTx.text = product
        self.nameTx.text = name
        self.orginPriceTx.text = "\(originalPrice)"
        self.salePriceTx.text = "\(salePrice)"
        self.filter = filter
    }
}
