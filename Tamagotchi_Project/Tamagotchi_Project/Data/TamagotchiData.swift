//
//  TamagotchiData.swift
//  Tamagotchi_Project
//
//  Created by 최형민 on 2022/07/23.
//

import Foundation
import UIKit

let imageArray = [[UIImage(named: "1-1"), UIImage(named: "1-2"), UIImage(named: "1-3"), UIImage(named: "1-4"), UIImage(named: "1-5"), UIImage(named: "1-6"), UIImage(named: "1-7"), UIImage(named: "1-8") ,UIImage(named: "1-9")], [UIImage(named: "2-1"), UIImage(named: "2-2"), UIImage(named: "2-3"), UIImage(named: "2-4"), UIImage(named: "2-5"), UIImage(named: "2-6"), UIImage(named: "2-7"), UIImage(named: "2-8") ,UIImage(named: "2-9")], [UIImage(named: "3-1"), UIImage(named: "3-2"), UIImage(named: "3-3"), UIImage(named: "3-4"), UIImage(named: "3-5"), UIImage(named: "3-6"), UIImage(named: "3-7"), UIImage(named: "3-8") ,UIImage(named: "3-9")]]

struct TamagotchiData {
    
    let tamagotchi: [Tamagotchi] = [
        Tamagotchi(name: "따끔따끔 다마고치", description: "저는 따끔따끔 다마고치인데 저 건들지 마세요 예민해지면 가시로 지를 수도 있으니까.", image: imageArray[0]),
        Tamagotchi(name: "방실방실 다마고치", description: "나는 방실방실 다마고치. 운동? 그게 뭐지, 난 오직 먹기만 해. 그럼 이만 밥 먹으러 갈게.", image: imageArray[1]),
        Tamagotchi(name: "반짝반짝 다마고치", description: "나는 반짝반짝 다마고치야>< 다른 둘에 비해 이쁘고 빛나지. 그럼 오늘도 화이팅해!!", image: imageArray[2])
    ]
}
