//
//  StartNewRoundVC.swift
//  GolfScore
//
//  Created by JaewooByun on 2021/04/21.
//

import Foundation
import UIKit

class StartNewRoundVC: UITableViewController {
    
    // MARK: Properties
    var cellId = "startnewroundcellid"
    var course: Course?
    var players: [Player] = []
    
    var courseSelected: Bool = false
    var playersSelected: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0) {
            return "COURSE"
        }
        else {
            return "PLAYERS"
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            if (course == nil) {
                return 1
            }
            else {
                return 3
            }
        }
        else {
            if (players.isEmpty) {
                return 1
            }
            else {
                return players.count
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as UITableViewCell
        cell.textLabel?.text = "hi"
        
        cell.accessoryType = .checkmark
//        let accessoryButton = UIButton(type: .custom)
//        accessoryButton.setImage(UIImage(named: "plus.circle.fill"), for: UIControl.State.normal)
//        accessoryButton.sizeToFit()
//
//        cell.accessoryView = accessoryButton
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && courseSelected == false {
            
            let selectCourseVC: SelectCourseVC = SelectCourseVC()
            
            self.navigationController?.pushViewController(selectCourseVC, animated: true)
            
            courseSelected = true
        }
        
        else {
            
        }
        
        
    }
    
    
    
    
    
    
    
}
