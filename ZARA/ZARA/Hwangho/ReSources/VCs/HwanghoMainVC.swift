//
//  HwanghoMainVC.swift
//  ZARA
//
//  Created by 송황호 on 2020/11/14.
//

import UIKit

class HwanghoMainVC: UIViewController {

    @IBOutlet weak var zaraCollectionView: UICollectionView!

    var zaraInformations : GenericResponse<[ZaraInformation]>?
    var newZaraInformations : GenericResponse<[ZaraInformation]>?
    
    var filter = 0      // 0일 때는 전체 다 보여저야 함
    var count : Int?
    
    override func viewWillAppear(_ animated: Bool) {
        setNotifi()
//        setinformations()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFirstServerData()
        zaraCollectionView.delegate = self
        zaraCollectionView.dataSource = self
        zaraCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
    func getFirstServerData(){
        ZaraHomeService.share.zaraHomeget {(NetworkResult) -> (Void) in
            switch NetworkResult{
            case .success(let data):
                guard let dt = data as? GenericResponse<[ZaraInformation]> else {return}
                self.zaraInformations = dt
                self.zaraCollectionView.reloadData()
                
            case .requestErr:
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    // Notification addObserver 관련 코드
    func setNotifi(){
        // filter = 0
        NotificationCenter.default.addObserver(self, selector: #selector(viewAllPressBtn), name: .init("viewAllPressBtn"), object: nil)
        // filter = 1
        NotificationCenter.default.addObserver(self, selector: #selector(coatPressBtn), name: .init("coatPressBtn"), object: nil)
        // filter = 2
        NotificationCenter.default.addObserver(self, selector: #selector(puffersPressBtn), name: .init("puffersPressBtn"), object: nil)
        // filter = 3
        NotificationCenter.default.addObserver(self, selector: #selector(waistCoatsPressBtn), name: .init("waistCoatsPressBtn"), object: nil)
        // filter = 4
        NotificationCenter.default.addObserver(self, selector: #selector(trenchCoatPressBtn), name: .init("trenchCoatPressBtn"), object: nil)
    }
    
    // filter == 0
    @objc func viewAllPressBtn( _ notification: Notification) {
        guard let userinfo = notification.userInfo as?[String:Any] else {return }
        guard let filtering = userinfo["filter"] as? Int else {return }
        self.filter = filtering
//        print("---> filter 받아옴 \(filter)")
        ZaraHomeService.share.zaraHomeget {(NetworkResult) -> (Void) in
            switch NetworkResult{
            case .success(let data):
                guard let dt = data as? GenericResponse<[ZaraInformation]> else {return}
                self.zaraInformations = dt
                self.zaraCollectionView.reloadData()
                
            case .requestErr:
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
    // filter == 1
    @objc func coatPressBtn( _ notification: Notification) {
        guard let userinfo = notification.userInfo as?[String:Any] else {return }
        guard let filtering = userinfo["filter"] as? Int else {return }
        self.filter = filtering
//        print("---> filter 받아옴 \(filter)")
        zaraHomeCoatService.share.zaraHomeCoatget {(NetworkResult) -> (Void) in
            switch NetworkResult{
            case .success(let data):
                guard let dt = data as? GenericResponse<[ZaraInformation]> else {return}
                self.zaraInformations = dt
                self.zaraCollectionView.reloadData()
                
            case .requestErr:
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
            self.dismiss(animated: true, completion: nil)
        }
        zaraCollectionView.reloadData()
    }
    // filter == 2
    @objc func puffersPressBtn( _ notification: Notification) {
        guard let userinfo = notification.userInfo as?[String:Any] else {return }
        guard let filtering = userinfo["filter"] as? Int else {return }
        self.filter = filtering
//        print("---> filter 받아옴 \(filter)")
        zaraHomepuffersService.share.zaraHomePuffersget {(NetworkResult) -> (Void) in
            switch NetworkResult{
            case .success(let data):
                guard let dt = data as? GenericResponse<[ZaraInformation]> else {return}
                self.zaraInformations = dt
                self.zaraCollectionView.reloadData()
                
            case .requestErr:
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
            self.dismiss(animated: true, completion: nil)
        }
        zaraCollectionView.reloadData()
    }
    // filter == 3
    @objc func waistCoatsPressBtn( _ notification: Notification) {
        guard let userinfo = notification.userInfo as?[String:Any] else {return }
        guard let filtering = userinfo["filter"] as? Int else {return }
        self.filter = filtering
//        print("---> filter 받아옴 \(filter)")
        zaraHomeWaistCoatService.share.zaraHomeCoatget{(NetworkResult) -> (Void) in
            switch NetworkResult{
            case .success(let data):
                guard let dt = data as? GenericResponse<[ZaraInformation]> else {return}
                self.zaraInformations = dt
                self.zaraCollectionView.reloadData()
                
            case .requestErr:
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
            self.dismiss(animated: true, completion: nil)
        }
        zaraCollectionView.reloadData()
    }
    // filter == 4
    @objc func trenchCoatPressBtn( _ notification: Notification) {
        guard let userinfo = notification.userInfo as?[String:Any] else {return }
        guard let filtering = userinfo["filter"] as? Int else {return }
        self.filter = filtering
//        print("---> filter 받아옴 \(filter)")
        zaraHomeTrenchCoatService.share.zaraHomeCoatget{(NetworkResult) -> (Void) in
            switch NetworkResult{
            case .success(let data):
                guard let dt = data as? GenericResponse<[ZaraInformation]> else {return}
                self.zaraInformations = dt
                self.zaraCollectionView.reloadData()
                
            case .requestErr:
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
            self.dismiss(animated: true, completion: nil)
        }
        zaraCollectionView.reloadData()
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
        print("총 개수는 \(zaraInformations?.data?.count ?? 0)")
        
        return zaraInformations?.data?.count ?? 0
    }
    
    // Header Cell 집어 넣기
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = zaraCollectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HwanghoMainCVHeaderCell.identifier, for: indexPath) as? HwanghoMainCVHeaderCell else {return UICollectionReusableView()}
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 전체 페이지
        guard let cell1 = zaraCollectionView.dequeueReusableCell(withReuseIdentifier: HwanghoMainCVCell.identifier, for: indexPath) as? HwanghoMainCVCell else {return UICollectionViewCell() }

        if let readings = zaraInformations?.data?[indexPath.row] {
            cell1.setInformation(imgUrl: readings.imgURL, name: readings.name, originPrice: readings.originPrice, isSale: readings.isSale, percent: readings.sale.percent, discountedPrice: readings.sale.discountedPrice)
        }
            return cell1
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(translationX: 50, y: 0)
               cell.alpha = 0
               UIView.animate(
                   withDuration: 0.5,
                   delay: 0,
                   options: [.curveEaseInOut],
                   animations: {
                       cell.transform = CGAffineTransform(translationX: 0, y: 0)
                       cell.alpha = 1 } )
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
            return CGSize(width: collectionView.frame.size.width-28 , height: 400)
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


