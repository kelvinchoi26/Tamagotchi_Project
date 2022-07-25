//
//  SettingTableViewController.swift
//  Tamagotchi_Project
//
//  Created by 최형민 on 2022/07/25.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    @IBOutlet var settingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func configureNavigation() {
        self.navigationItem.title = "설정"
        self.navigationItem.leftBarButtonItem?.title = ""
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
        let index = indexPath.row
        
        switch index {
        case 0:
            cell.tableViewImage[0].image = UIImage(systemName: "pencil")
            cell.tableViewTitle[0].text = "내 이름 설정하기"
            cell.userNameLabel.text = UserDefaults.standard.string(forKey: "userName")
        case 1:
            cell.tableViewImage[0].image = UIImage(systemName: "moon.fill")
            cell.tableViewTitle[0].text = "다마고치 변경하기"
            cell.userNameLabel.text = ""
        case 2:
            cell.tableViewImage[0].image = UIImage(systemName: "goforward")
            cell.tableViewTitle[0].text = "데이터 초기화"
            cell.userNameLabel.text = ""
        default:
            break
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        
        if row == 0 {
            let sb = UIStoryboard(name: "NameChange", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "NameChangeViewController") as! NameChangeViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
        } else if row == 1 {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "FirstScreenCollectionViewController") as! FirstScreenCollectionViewController
            
            vc.navigationItem.title = "다마고치 변경하기"
            
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let alert = UIAlertController(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실 건가용?", preferredStyle: UIAlertController.Style.alert)
            
            let cancel = UIAlertAction(title: "놉", style: .default)
            let change = UIAlertAction(title: "예스", style: .default, handler: resetButtonClicked)
            
            alert.addAction(cancel)
            alert.addAction(change)
            
            present(alert, animated: true)
        }
    }
    
    func resetButtonClicked(alert: UIAlertAction) {
        UserDefaults.standard.set("대장", forKey: "userName")
        UserDefaults.standard.set(1, forKey: "level")
        UserDefaults.standard.set(0, forKey: "riceCount")
        UserDefaults.standard.set(0, forKey: "waterCount")
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "FirstScreenCollectionViewController") as! FirstScreenCollectionViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
