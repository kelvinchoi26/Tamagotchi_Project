//
//  FirstScreenCollectionViewController.swift
//  Tamagotchi_Project
//
//  Created by 최형민 on 2022/07/23.
//

import UIKit
import Toast

private let reuseIdentifier = "Cell"

class FirstScreenCollectionViewController: UICollectionViewController {
    
    let tamagotchiInstance = TamagotchiData()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewLayout()
        configureCellLayout()
        
//        if !UserDefaults.standard.bool(forKey: "ChangeTamagotchi") {
//            setUserDefaults()
//
//        }
    }
    
    func setUserDefaults() {
        UserDefaults.standard.set("대장", forKey: "userName")
        UserDefaults.standard.set(0, forKey: "riceCount")
        UserDefaults.standard.set(0, forKey: "waterCount")
        UserDefaults.standard.set(1, forKey: "level")
        UserDefaults.standard.set(false, forKey: "ChangeTamagotchi")
    }
    
    func configureViewLayout() {
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        if UserDefaults.standard.bool(forKey: "ChangeTamagotchi") {
            self.navigationItem.title = "다마고치 변경하기"
        } else {
            self.navigationItem.title = "다마고치 선택하기"
        }
    }
    
    func configureCellLayout() {
        // 컬렉션뷰의 셀 크기, 셀 사이 간격 등 설정
        let layout = UICollectionViewFlowLayout()
        // FlowLayout!
        let spacing: CGFloat = 10
        let width = UIScreen.main.bounds.width - (spacing * 4)
        // 여백없이 디바이스를 3으로 나눔
        layout.itemSize = CGSize(width: width / 3, height: (width / 3) * 1.2)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 30
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstScreenCollectionViewCell", for: indexPath) as! FirstScreenCollectionViewCell
    
        let index = indexPath.item
        
        if index < 3 {
            let data = tamagotchiInstance.tamagotchi[indexPath.item]
            cell.configureCell(data: data)
        } else {
            
            cell.tamagotchiName.font = .boldSystemFont(ofSize: 14)
            cell.tamagotchiName.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
            cell.tamagotchiName.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
            cell.tamagotchiName.layer.borderWidth = 1
            cell.tamagotchiName.layer.cornerRadius = 5
            cell.tamagotchiName.text = "  준비중이에요  "
            
            cell.tamagotchiImage.image = UIImage(named: "noImage")
        }
    
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let index = indexPath.item
        if index > 2 {
            view.makeToast("아직 준비중이에요 ㅠ", duration: 1)
        } else {
            let sb = UIStoryboard.init(name: "PopUp", bundle: nil)
            let popUpVC = sb.instantiateViewController(withIdentifier: "PopUpViewController") as! PopUpViewController
            
            popUpVC.modalPresentationStyle = .overCurrentContext
            
            let data = tamagotchiInstance.tamagotchi[index]
            
            popUpVC.tamagotchiData = data
            
            self.present(popUpVC, animated: true, completion: nil)
        }
    }

}
