//
//  SelectCourseVC.swift
//  GolfScore
//
//  Created by JaewooByun on 2021/04/28.
//

import Foundation
import UIKit
import CoreData

class SelectCourseVC: UITableViewController {
    
    let courseCellID = "courseCellID"
    
    var managedContext: NSManagedObjectContext!
    
    var currentCourse: Course?
    
    var courses: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Select Course"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        self.managedContext = appDelegate.coreDataStack.managedContext
        
        let courseFetchRequest = NSFetchRequest<Course>(entityName: "Course")
        
        do {
            courses = try managedContext.fetch(courseFetchRequest)
        } catch let error as NSError {
            print(error, error.userInfo)
        }
        
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: courseCellID)
        
        
        tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: courseCellID, for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = courses[indexPath.row].value(forKey: "name") as? String
            
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: selection
        
        
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .normal, title: "Edit") { (ac: UIContextualAction, view: UIView, success: (Bool) -> Void) in
            success(true)
            //TODO: Edit actions.
        }
        editAction.backgroundColor = .systemBlue
        
        return UISwipeActionsConfiguration(actions: [editAction])
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (ac: UIContextualAction, view: UIView, success:(Bool) -> Void) in
            success(true)
            
            let courseToRemove = self.courses[indexPath.row]
            self.managedContext.delete(courseToRemove)
            self.courses.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            do {
                try self.managedContext.save()
            } catch let error as NSError {
                print("Saving error: \(error), description: \(error.userInfo)")
            }
            
        }
        
        deleteAction.backgroundColor = .systemRed
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
}
