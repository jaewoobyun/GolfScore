//
//  BaseTableVC.swift
//  GolfScore
//
//  Created by JaewooByun on 2021/04/20.
//

import Foundation
import UIKit
import CoreData

class BaseTableVC: UITableViewController {
    
    let playerOrCourseCellID = "playerOrCourseCellID"
    let roundCellID = "roundCellID"
    
    
    var players: [NSManagedObject] = []
    var courses: [NSManagedObject] = []
    var rounds: [NSManagedObject] = []
    
//    init(model: String) {
//        super.init()
//        
//        self.titleName = model
//        
//        if model == "Players" {
//            print("players")
//        }
//        if model == "Courses" {
//            print("courses")
//        }
//        if model == "Rounds" {
//            print("rounds")
//        }
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addData))
        
        navigationItem.rightBarButtonItem = addButton
        
        registerTableViewCells()
        
    }
    
    private func registerTableViewCells() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: playerOrCourseCellID)
//        tableView.register(UINib(nibName: "RoundsCell", bundle: nil), forCellReuseIdentifier: roundCellID)
        tableView.register(RoundsCell.self, forCellReuseIdentifier: roundCellID)
        
        
    }
    
    @objc func addData() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        if (self.title == "Rounds") {
            let startNewRoundVC = storyboard.instantiateViewController(identifier: "StartNewRoundVC")
            self.navigationController?.pushViewController(startNewRoundVC, animated: true)
        }
        if (self.title == "Players") {
            let createPlayerVC = storyboard.instantiateViewController(identifier: "CreatePlayerVC")
            self.navigationController?.pushViewController(createPlayerVC, animated: true)
        }
        if (self.title == "Courses") {
//            let createCourseVC = storyboard.instantiateViewController(identifier: "CreateCourseVC")
//            self.navigationController?.pushViewController(createCourseVC, animated: true)
        }
    }
    
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //2
        let playerFetchRequest = NSFetchRequest<Player>(entityName: "Player")
        let roundFetchRequest = NSFetchRequest<Round>(entityName: "Round")
        let courseFetchRequest = NSFetchRequest<Course>(entityName: "Course")
        
        //3
        do {
            players = try managedContext.fetch(playerFetchRequest)
        } catch let error as NSError {
            print(error, error.userInfo)
        }
        
        do {
            courses = try managedContext.fetch(courseFetchRequest)
        } catch let error as NSError {
            print(error, error.userInfo)
        }
        
        do {
            rounds = try managedContext.fetch(roundFetchRequest)
        } catch let error as NSError {
            print(error, error.userInfo)
        }
        
        
        
    }
    
    
    // MARK: Tableview Delegate
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            //TODO: handle delete
//        }
//
//    }
    
 
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .normal, title: "Edit") { (ac: UIContextualAction, view: UIView, success:(Bool) -> Void) in
            success(true)
        }
        editAction.backgroundColor = .blue
        
        return UISwipeActionsConfiguration(actions: [editAction])
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (ac: UIContextualAction, view: UIView, success:(Bool) -> Void) in
            success(true)
        }
        deleteAction.backgroundColor = .red
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
        
    }
    
    // MARK: Tableview Datasource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.title == "Rounds") {
            return rounds.count
            
            
        }
        else if (self.title == "Players") {
            return players.count
        }
        else if (self.title == "Courses") {
            return courses.count
        }
        
        else { return 1 }
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if (self.title == "Courses" || (self.title == "Player")) {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: playerOrCourseCellID, for: indexPath) as UITableViewCell
            
            return cell
        }
        else { // if (self.title == "Rounds")
//            cell = tableView.dequeueReusableCell(withIdentifier: roundCellID, for: indexPath) as! RoundsCell
            
            let roundsCell = tableView.dequeueReusableCell(withIdentifier: roundCellID, for: indexPath) as! RoundsCell
//            roundsCell.courseLabel.text = "A"
//            roundsCell.dateLabel.text = "2021"
//            roundsCell.holesLabel.text = "18"
//            roundsCell.playersLabel.text = "B,C"
            
//            guard let roundsCell = tableView.dequeueReusableCell(withIdentifier: roundCellID, for: indexPath) as? RoundsCell else { return UITableViewCell() }
            
//                roundsCell.courseLabel.text = "A"
//                roundsCell.dateLabel.text = "2021"
//                roundsCell.holesLabel.text = "18"
//                roundsCell.playersLabel.text = "B,C"
            
            return roundsCell
        }
        
//        return cell
    }
    
    
    
    
    
}
