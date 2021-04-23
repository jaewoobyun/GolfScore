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
    
    var managedContext: NSManagedObjectContext!
    
    var currentPlayer: Player?
    var currentCourse: Course?
    var currentRound: Round?
    
    var players: [NSManagedObject] = []
    var courses: [NSManagedObject] = []
    var rounds: [NSManagedObject] = []
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
    
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
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        //1
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        //        let managedContext = appDelegate.persistentContainer.viewContext
        self.managedContext = appDelegate.coreDataStack.managedContext
        
        tableView.reloadData()
        
        
    }
    
    private func registerTableViewCells() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: playerOrCourseCellID)
//        tableView.register(UINib(nibName: "Main", bundle: nil), forCellReuseIdentifier: playerOrCourseCellID)
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
            let createCourseVC = storyboard.instantiateViewController(identifier: "CreateCourseVC")
            self.navigationController?.pushViewController(createCourseVC, animated: true)
        }
    }
    
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        //1
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//        let managedContext = appDelegate.persistentContainer.viewContext
        self.managedContext = appDelegate.coreDataStack.managedContext
        

        //2
        let playerFetchRequest = NSFetchRequest<Player>(entityName: "Player")
        let roundFetchRequest = NSFetchRequest<Round>(entityName: "Round")
        let courseFetchRequest = NSFetchRequest<Course>(entityName: "Course")

        //3
        do {
            players = try self.managedContext.fetch(playerFetchRequest)
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

        tableView.reloadData()
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
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (ac: UIContextualAction, view: UIView, success:(Bool) -> Void) in
//            success(true)
            
            if (self.title == "Rounds") {
                
            }
            else if (self.title == "Players") {
                let playerToRemove = self.players[indexPath.row]
                self.managedContext.delete(playerToRemove)
                self.players.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                
                do {
                    try self.managedContext.save()
                } catch let error as NSError {
                    print("Saving error: \(error), description: \(error.userInfo)")
                }
                
            }
            else if (self.title == "Courses") {
                
            }
            else {
                
            }
            
            
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
        else {
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (self.title == "Rounds") {
            let roundCell = tableView.dequeueReusableCell(withIdentifier: roundCellID)! as! RoundsCell
            roundCell.playersLabel.text = "a"
            roundCell.dateLabel.text = "2021"
            roundCell.courseLabel.text = "course"
            roundCell.holesLabel.text = "18"
            return roundCell
        }
        else if (self.title == "Players") {
            let playerCell = tableView.dequeueReusableCell(withIdentifier: playerOrCourseCellID)! as UITableViewCell
            playerCell.textLabel?.text = players[indexPath.row].value(forKey: "name") as? String
            return playerCell
        }
        else if (self.title == "Courses") {
            let courseCell = tableView.dequeueReusableCell(withIdentifier: playerOrCourseCellID)! as UITableViewCell
            courseCell.textLabel?.text = courses[indexPath.row].value(forKey: "name") as? String
            return courseCell
        }
        else {
            let defaultCell = UITableViewCell(style: .default, reuseIdentifier: "cell") as UITableViewCell
            defaultCell.textLabel?.text = "default"
            
            return defaultCell
        }
        
        
        

    }
    
    
    
    
    
}
