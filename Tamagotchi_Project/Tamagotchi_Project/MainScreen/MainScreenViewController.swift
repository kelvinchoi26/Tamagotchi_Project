//
//  MainScreenViewController.swift
//  Tamagotchi_Project
//
//  Created by 최형민 on 2022/07/25.
//

import UIKit

class MainScreenViewController: UIViewController {

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

    }
    
    @objc func settingButtonClicked() {
        
    }
    
    func configureNavigation() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(settingButtonClicked))
        self.navigationController?.title = "님의 다마고치"
    }
    
    func configureMainScreen() {
        messageBoxImage.image = UIImage(named: "bubble")
    }

}
