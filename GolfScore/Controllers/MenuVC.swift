//
//  MenuVC.swift
//  GolfScore
//
//  Created by JaewooByun on 2021/04/20.
//

import Foundation
import UIKit
import SideMenu

class MenuVC: UITableViewController {
    
    let menu = ["Home", "Courses", "Players", "Rounds"]
    
    var baseTableVC: BaseTableVC?
    
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellreuseid")
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellreuseid")!
        
        cell.textLabel?.text = menu[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let baseTableVC = storyboard.instantiateViewController(identifier: "BaseTableVC")
        
        if indexPath.row == 1 {
//            baseTableVC = BaseTableVC(model: "Courses")
            baseTableVC.title = "Courses"
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        }
        if indexPath.row == 2 {
//            baseTableVC = BaseTableVC(model: "Players")
            baseTableVC.title = "Players"
        }
        if indexPath.row == 3 {
//            baseTableVC = BaseTableVC(model: "Rounds")
            baseTableVC.title = "Rounds"
        }
        
        
        self.navigationController?.pushViewController(baseTableVC, animated: true)
    }
    
}
