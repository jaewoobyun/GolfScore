//
//  CreatePlayerVC.swift
//  GolfScore
//
//  Created by JaewooByun on 2021/04/21.
//

import Foundation
import UIKit
import CoreData

class CreatePlayerVC: UIViewController {
    
    var players: [NSManagedObject] = []
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    var managedContext: NSManagedObjectContext!
    
//    lazy var coreDataStack = CoreDataStack
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    func savePlayer(name: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Player", in: managedContext)!
        let player = NSManagedObject(entity: entity, insertInto: managedContext)
        
        player.setValue(name, forKey: "name")
        
        do {
            try managedContext.save()
            players.append(player)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    @IBAction func saveButton(_ sender: Any) {
        guard let nameToSave = self.nameTextField.text else { return }
        self.dismiss(animated: true) {
            self.savePlayer(name: nameToSave)
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    
    
}
