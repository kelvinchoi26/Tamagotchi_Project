//
//  MainScreenViewController.swift
//  Tamagotchi_Project
//
//  Created by 최형민 on 2022/07/25.
//

import UIKit
import Toast

class MainScreenViewController: UIViewController {
    
    var tamagotchiData: Tamagotchi?
    
    let message = ["아파도 버티세요! \(UserDefaults.standard.string(forKey: "userName")!)님 ㅠㅠ", "화이팅 얼마 남지 않았습니다 ㅠㅠ", "좋은 곳에 취직하려면 지금보다 백배는 더 열심히 하세요", "지금 잠이 오십니까?", "과제 쉽지 않쥬? ㅠ", "거의 다 왔어요!!", "일부러 이러시는거죠?", "아 배불러요 그만 좀 줘요;;", "배 터지겠습니다."]

    @IBOutlet weak var messageBoxImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var tamagotchiImage: UIImageView!
    @IBOutlet weak var tamagotchiName: UILabel!
    @IBOutlet weak var tamagotchiInfo: UILabel!
    
    @IBOutlet weak var riceTextField: UITextField!
    @IBOutlet weak var waterTextField: UITextField!
    
    @IBOutlet weak var riceButton: UIButton!
    @IBOutlet weak var waterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigation()
        configureMainScreen()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        configureNavigation()
    }
    
    func updateLevel(rice: Int, water: Int) -> Int {
        let calculate = (Double(rice)/5 + Double(water)/2)
        var level: Int
        
        switch Int(calculate) {
        case 0...19:
            level = 1
        case 20...29:
            level = 2
        case 30...39:
            level = 3
        case 40...49:
            level = 4
        case 50...59:
            level = 5
        case 60...69:
            level = 6
        case 70...79:
            level = 7
        case 80...89:
            level = 8
        case 90...99:
            level = 9
        default:
            level = 10
        }
        
        return level
    }
    
    func updateValue() {
        let riceCount = UserDefaults.standard.integer(forKey: "riceCount")
        let waterCount = UserDefaults.standard.integer(forKey: "waterCount")
        let level = updateLevel(rice: riceCount, water: waterCount)
        
        tamagotchiInfo.text = "LV\(level) · 밥알 \(riceCount)개 · 물방울 \(waterCount)개"
        
        if level == 10 {
            tamagotchiImage.image = tamagotchiData?.image[8]
        } else {
            tamagotchiImage.image = tamagotchiData?.image[level-1]
        }
        
        riceButton.titleLabel?.text = "밥먹기"
        waterButton.titleLabel?.text = "물먹기"
        
        if UserDefaults.standard.integer(forKey: "level") == 10 {
            messageLabel.text = message[Int.random(in: 6...8)]
        }
        messageLabel.text = message[Int.random(in: 0...5)]
    }
    
    func configureNavigation() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(settingButtonClicked))
        self.navigationItem.title = "\(UserDefaults.standard.string(forKey: "userName")!)님의 다마고치"
    }
    
    @objc func settingButtonClicked() {
        let sb = UIStoryboard.init(name: "Setting", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SettingTableViewController") as! SettingTableViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func configureMainScreen() {
        messageBoxImage.image = UIImage(named: "bubble")
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = .systemFont(ofSize: 13)
        
        if UserDefaults.standard.integer(forKey: "level") == 10 {
            messageLabel.text = message[Int.random(in: 6...8)]
        }
        messageLabel.text = message[Int.random(in: 0...5)]
        
        tamagotchiImage.image = tamagotchiData?.image[0]
        
        tamagotchiName.font = .boldSystemFont(ofSize: 14)
        tamagotchiName.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        tamagotchiName.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        tamagotchiName.layer.borderWidth = 1
        tamagotchiName.layer.cornerRadius = 2
        tamagotchiName.text = tamagotchiData?.name
        
        tamagotchiInfo.font = .boldSystemFont(ofSize: 14)
        tamagotchiInfo.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        tamagotchiInfo.text = "LV\(UserDefaults.standard.integer(forKey: "level")) · 밥알 \(UserDefaults.standard.integer(forKey: "riceCount")) · 물방울 \(UserDefaults.standard.integer(forKey: "waterCount"))"
        
        riceTextField.placeholder = "밥주세용"
        riceTextField.textAlignment = .center
        riceTextField.borderStyle = .none
        waterTextField.placeholder = "물주세용"
        waterTextField.textAlignment = .center
        waterTextField.borderStyle = .none
        
        riceButton.titleLabel?.text = "밥먹기"
        riceButton.titleLabel?.font = .boldSystemFont(ofSize: 14)
        riceButton.titleLabel?.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        riceButton.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        riceButton.layer.borderWidth = 1
        riceButton.layer.cornerRadius = 2
        
        waterButton.titleLabel?.text = "물먹기"
        waterButton.titleLabel?.font = .boldSystemFont(ofSize: 14)
        waterButton.titleLabel?.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        waterButton.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        waterButton.layer.borderWidth = 1
        waterButton.layer.cornerRadius = 2
    }

    @IBAction func riceButtonClicked(_ sender: UIButton) {
        var riceCount = UserDefaults.standard.integer(forKey: "riceCount")
        
        if let text = riceTextField.text {
            if text.isEmpty == true {
                riceCount += 1
                UserDefaults.standard.set(riceCount, forKey: "riceCount")
            } else {
                let num = Int(riceTextField.text!)!
                switch num {
                case 1...99:
                    UserDefaults.standard.set(riceCount+num, forKey: "riceCount")
                default:
                    view.makeToast("악 저 돼지 아니에요!!", duration: 1)
                }
            }
        
        riceTextField.text = ""
        updateValue()
        view.endEditing(true)
        }
    }
    
    @IBAction func waterButtonClicked(_ sender: UIButton) {
        var waterCount = UserDefaults.standard.integer(forKey: "waterCount")
        
        if let text = waterTextField.text {
            if text.isEmpty == true {
                waterCount += 1
                UserDefaults.standard.set(waterCount, forKey: "waterCount")
            } else {
                let num = Int(waterTextField.text!)!
                switch num {
                case 1...49:
                    UserDefaults.standard.set(waterCount+num, forKey: "waterCount")
                default:
                    view.makeToast("악 저 물배 찼어요!!", duration: 1)
                }
            }
        
        waterTextField.text = ""
        updateValue()
        view.endEditing(true)
        }
    }
    
    @IBAction func TapGestureClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func riceReturnClicked(_ sender: UITextField) {
        var riceCount = UserDefaults.standard.integer(forKey: "riceCount")
        let num = Int(riceTextField.text ?? "0")!
        
        switch num {
        case 0:
            riceCount += 1
            UserDefaults.standard.set(riceCount, forKey: "riceCount")
        case 1...99:
            UserDefaults.standard.set(riceCount+num, forKey: "riceCount")
        default:
            view.makeToast("악 저 돼지 아니에요!!", duration: 1)
        }
        
        riceTextField.text = ""
        updateValue()
        view.endEditing(true)
    }
    
    @IBAction func waterReturnClicked(_ sender: UITextField) {
        var waterCount = UserDefaults.standard.integer(forKey: "waterCount")
        let num = Int(waterTextField.text ?? "0")!
        
        switch num {
        case 0:
            waterCount += 1
            UserDefaults.standard.set(waterCount, forKey: "waterCount")
        case 1...49:
            UserDefaults.standard.set(waterCount+num, forKey: "waterCount")
        default:
            view.makeToast("악 물배차요!!", duration: 1)
        }
        
        waterTextField.text = ""
        updateValue()
        view.endEditing(true)
    }
}
    
