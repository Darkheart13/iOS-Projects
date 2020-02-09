//
//  AddToDoViewController.swift
//  To-Do List
//
//  Created by Diyor_Khakimov on 8/7/19.
//  Copyright © 2019 Diyor_Khakimov. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    var previousVC = ToDoTableViewController()

    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
      
        /*let toDo = ToDo()
        
        if let titleText = titleTextField.text {
            
        toDo.name = titleText
        toDo.important = importantSwitch.isOn
        
        previousVC.toDos.append(toDo)
        previousVC.tableView.reloadData()
    
      navigationController?.popViewController(animated: true)
        }
    */
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
        
    let toDo = ToDoCoreData(entity: ToDoCoreData.entity(), insertInto: context)
        
            if let titleText = titleTextField.text {
                
                toDo.name = titleText
                toDo.important = importantSwitch.isOn
            }
            
    try? context.save()
            
    navigationController?.popViewController(animated: true)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
