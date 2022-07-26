//
//  PopUpViewController.swift
//  Tamagotchi_Project
//
//  Created by 최형민 on 2022/07/24.
//

import UIKit

class PopUpViewController: UIViewController {
    
    var tamagotchiData: Tamagotchi?
    
    @IBOutlet weak var tamagotchiView: UIView!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var tamagotchiImage: UIImageView!
    @IBOutlet weak var tamagotchiName: UILabel!
    @IBOutlet weak var separateLine: UIView!
    @IBOutlet weak var tamagotchiDetail: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        view.isOpaque = false
        
        configurePopUp()
    }
    
    func configurePopUp() {
        
        tamagotchiImage.image = tamagotchiData?.image[5]
        
        popUpView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        tamagotchiView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        popUpView.layer.borderWidth = 1
        popUpView.layer.borderColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1).cgColor
        popUpView.layer.cornerRadius = 10
        
        tamagotchiName.font = .boldSystemFont(ofSize: 14)
        tamagotchiName.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        tamagotchiName.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        tamagotchiName.layer.borderWidth = 1
        tamagotchiName.layer.cornerRadius = 5
        tamagotchiName.text = tamagotchiData?.name
        tamagotchiName.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 255/255, alpha: 1)
        
        tamagotchiDetail.textAlignment = .center
        tamagotchiDetail.font = .systemFont(ofSize: 13)
        tamagotchiDetail.text = tamagotchiData?.description
        
        separateLine.backgroundColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.setTitleColor(UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1), for: .normal)
        cancelButton.titleLabel?.font = .systemFont(ofSize: 13)
        cancelButton.tintColor = UIColor(red: 235/255, green: 240/255, blue: 252/255, alpha: 1)
        
        if UserDefaults.standard.bool(forKey: "ChangeTamagotchi") {
            startButton.setTitle("변경하기", for: .normal)
        } else {
            startButton.setTitle("시작하기", for: .normal)
        }
        
        startButton.setTitleColor(UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1), for: .normal)
        startButton.titleLabel?.font = .systemFont(ofSize: 13)
        startButton.tintColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    }
    
    @IBAction func startButtonClicked(_ sender: UIButton) {
        // 1.
        let sb = UIStoryboard(name: "MainScreen", bundle: nil)
        // 2.
        let vc = sb.instantiateViewController(withIdentifier: "MainScreenViewController") as! MainScreenViewController
        
        vc.tamagotchiData = tamagotchiData
        UserDefaults.standard.set(false, forKey: "ChangeTamagotchi")
        
        // 2.5. (네비게이션 포함 풀스크린)
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        
        // 3.
        self.present(nav, animated: true)
    }
    
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
