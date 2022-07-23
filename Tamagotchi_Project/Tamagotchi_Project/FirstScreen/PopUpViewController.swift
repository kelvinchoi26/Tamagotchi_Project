//
//  PopUpViewController.swift
//  Tamagotchi_Project
//
//  Created by 최형민 on 2022/07/24.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var tamagotchiImage: UIImageView!
    @IBOutlet weak var tamagotchiName: UILabel!
    @IBOutlet weak var separateLine: UIView!
    @IBOutlet weak var tamagotchiDetail: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurePopUp()
    }
    
    func configurePopUp() {
        popUpView.layer.borderWidth = 1
        popUpView.layer.borderColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1).cgColor
        popUpView.layer.cornerRadius = 5
        
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        tamagotchiName.font = .boldSystemFont(ofSize: 14)
        tamagotchiName.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        tamagotchiName.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        tamagotchiName.layer.borderWidth = 1
        tamagotchiName.layer.cornerRadius = 2
        
        tamagotchiDetail.textAlignment = .center
        tamagotchiDetail.font = .systemFont(ofSize: 13)
        separateLine.backgroundColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        
        cancelButton.titleLabel!.text = "취소"
        cancelButton.titleLabel?.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        cancelButton.titleLabel?.font = .systemFont(ofSize: 13)
        cancelButton.backgroundColor = UIColor(red: 209/255, green: 209/255, blue: 214/255, alpha: 1)
        
        startButton.titleLabel!.text = "시작하기"
        startButton.titleLabel?.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        startButton.titleLabel?.font = .systemFont(ofSize: 13)
        startButton.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    }
    
}
