//
//  CreateCourseVC.swift
//  GolfScore
//
//  Created by JaewooByun on 2021/04/22.
//

import Foundation
import UIKit

class CreateCourseVC: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var courseNameTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    let holeCellID = "holeCellID"
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
//        tableView.register(HoleCell.self, forCellReuseIdentifier: holeCellID)
        tableView.register(UINib(nibName: "HoleCell", bundle: nil), forCellReuseIdentifier: holeCellID)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    
    
}

extension CreateCourseVC: UITableViewDelegate {
    
}

extension CreateCourseVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 18
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: holeCellID, for: indexPath) as! HoleCell
        
        cell.holeNumberLabel.text = "\(indexPath.row)"
//        cell.parTextField.text = "4"
        
        
        return cell
    }
    
    
}
