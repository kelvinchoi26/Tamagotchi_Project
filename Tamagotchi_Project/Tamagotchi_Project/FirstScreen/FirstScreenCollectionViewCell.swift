//
//  FirstScreenCollectionViewCell.swift
//  Tamagotchi_Project
//
//  Created by 최형민 on 2022/07/23.
//

import UIKit

class FirstScreenCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tamagotchiImage: UIImageView!
    @IBOutlet weak var tamagotchiName: UILabel!
    
    func configureCell(data: Tamagotchi) {
        tamagotchiName.font = .boldSystemFont(ofSize: 14)
        tamagotchiName.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        tamagotchiName.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        tamagotchiName.layer.borderWidth = 1
        tamagotchiName.layer.cornerRadius = 2
        tamagotchiName.text = data.name
        
        // 우선은 첫 번째 사진 강제로 지정, 나중에는 UserDefaults 값에 따라 조건문 생성
        tamagotchiImage.image = data.image[0]
    }
}
