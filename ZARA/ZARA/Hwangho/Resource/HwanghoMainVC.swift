//
//  HwanghoMainVC.swift
//  ZARA
//
//  Created by 송황호 on 2020/11/14.
//

import UIKit

class HwanghoMainVC: UIViewController {

    @IBOutlet weak var zaraCollectionView: UICollectionView!
    
    var informations : [information] = []

    var counts = 8
    var filter = 1
    
    override func viewWillAppear(_ animated: Bool) {
        setinformations()
        
        NotificationCenter.default.addObserver(self, selector: #selector(viewAllPressBtn), name: .init("viewAllPressBtn"), object: nil)
    }


    // 체크박스 관련 objc
        @objc func viewAllPressBtn(_ notification: Notification){
            guard let userInfo = notification.userInfo as? [String: Any] else { return }
            guard let filter = userInfo["filter"] as? String else { return }
            self.filter = Int("\(filter)")!
            print(" 잘 들어옴?\(filter)")
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        zaraCollectionView.delegate = self
        zaraCollectionView.dataSource = self
        zaraCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
    
    func setinformations(){
        let data1 = information(image: "proImg2", product: "NEW", name: "WOOL BLEND COAT WITH BELT", originalPrice: 4000, salePrice: 30000 , filter: 1)
        let data2 = information(image: "proImg2", product: "40% OFF", name: "FAUX SHEARLINF COAT", originalPrice: 234000, salePrice: 20000 , filter: 1)
        let data3 = information(image: "rectangle9", product: "NEW", name: "CONTRAST PUFFER JACKET", originalPrice: 23400, salePrice: 12400 , filter: 1)
        let data4 = information(image: "proImg2", product: "30% OFF", name: "WOOL BLEND COAT WITH BELT", originalPrice: 53200, salePrice: 39000 , filter: 1)
        let data5 = information(image: "proImg2", product: "NEW", name: "FAUX SHEARLINF COAT", originalPrice: 42100, salePrice: 23100 , filter: 1)
        let data6 = information(image: "proImg2", product: "NEW", name: "CONTRAST PUFFER JACKET", originalPrice: 52900, salePrice: 45200 , filter: 1)

        informations = [data1, data2,data3,data4,data5, data6]
    }
    
    // MENU 버튼
    @IBAction func menuPressBtn(_ sender: Any) {
        guard let VC = storyboard?.instantiateViewController(withIdentifier: HwanghoMenuVC.identifier) as? HwanghoMenuVC else {return }
        
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true, completion: nil)
    }
}


// MARK: CollectionView DataSource 관련
extension HwanghoMainVC : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return informations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 전체 페이지
        guard let cell1 = zaraCollectionView.dequeueReusableCell(withReuseIdentifier: HwanghoMainCVCell.identifier, for: indexPath) as? HwanghoMainCVCell else {return UICollectionViewCell() }
        
        guard let cell2 = zaraCollectionView.dequeueReusableCell(withReuseIdentifier: HwanghoMainCVCell2.identifier, for: indexPath) as? HwanghoMainCVCell2 else{ return UICollectionViewCell()}

        if informations[indexPath.row].filter == 1{
            cell1.setInformation(image: informations[indexPath.row].image, product: informations[indexPath.row].product, name: informations[indexPath.row].name, originalPrice: informations[indexPath.row].originalPrice, salePrice: informations[indexPath.row].salePrice, filter: informations[indexPath.row].filter)
            
            cell1.isHidden = false
            cell2.isHidden = true
            return cell1
        }else{
            cell1.setInformation(image: informations[indexPath.row].image, product: informations[indexPath.row].product, name: informations[indexPath.row].name, originalPrice: informations[indexPath.row].originalPrice, salePrice: informations[indexPath.row].salePrice, filter: informations[indexPath.row].filter)
            
            cell1.isHidden = true
            cell2.isHidden = false
            return cell2
        }
            
    }
    
    // Header Cell 집어 넣기
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = zaraCollectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HwanghoMainCVHeaderCell.identifier, for: indexPath) as? HwanghoMainCVHeaderCell else {return UICollectionReusableView()}
        
        return header
    }
}

// MARK: CollectionView Delegate FlowLayout 관련
extension HwanghoMainVC : UICollectionViewDelegateFlowLayout{
    
    // header Cell Size 관련
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width : CGFloat = collectionView.frame.width
        let height : CGFloat = 40
        
        return CGSize(width: width, height: height)
    }
    
    // cell 가로 세로
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (indexPath.row+1)%3 == 0 {
            return CGSize(width: collectionView.frame.size.width-28 , height: 320)
        }else{
            return CGSize(width: (collectionView.frame.size.width/2)-28 , height: 320)
        }
    }
    // cell 위 아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    // cell 좌,우 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    // collectionview contentsInset 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
}


// MARK: CollectionView Delegate 관련
extension HwanghoMainVC : UICollectionViewDelegate{
    
}


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
        viewAllBtn.addTarget(self, action:  #selector(viewAllPressBtn), for: .touchUpInside)
        coatBtn.addTarget(self, action:  #selector(coatPressBtn), for: .touchUpInside)
        puffersBtn.addTarget(self, action:  #selector(puffersPressBtn), for: .touchUpInside)
        waistCoatsBtn.addTarget(self, action:  #selector(waistCoatsPressBtn), for: .touchUpInside)
        trenchCoatBtn.addTarget(self, action:  #selector(trenchCoatPressBtn), for: .touchUpInside)
    }
    
    @objc func viewAllPressBtn() {
        filters = 0
        print("viewAllPressBtn 눌렀음 \(filters)")
        NotificationCenter.default.post(name: .init("viewAllPressBtn"), object: nil, userInfo: ["filter":filters])
    }
    @objc func coatPressBtn() {
        filters = 1
        print("coatPressBtn 눌렀음 \(filters)")
    }
    @objc func puffersPressBtn() {
        filters = 2
        print("puffersPressBtn 눌렀음 \(filters)")
    }
    @objc func waistCoatsPressBtn() {
        filters = 3
        print("waistCoatsPressBtn 눌렀음 \(filters)")
    }
    @objc func trenchCoatPressBtn() {
        filters = 4
        print("trenchCoatPressBtn 눌렀음 \(filters)")
    }
}

// MARK: 내부 Cell 관련
class HwanghoMainCVCell : UICollectionViewCell{
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

// MARK: 내부 Cell2 관련
class HwanghoMainCVCell2 : UICollectionViewCell{
    static let identifier = "HwanghoMainCVCell2"
    
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


// 구조체
struct information {
    let image : String
    let product : String
    let name : String
    let originalPrice : Int
    let salePrice : Int
    let filter : Int
    
    init(image: String, product : String, name: String, originalPrice:Int, salePrice : Int, filter : Int) {
        self.image = image
        self.product = product
        self.name = name
        self.originalPrice = originalPrice
        self.salePrice = salePrice
        self.filter = filter
    }
}
