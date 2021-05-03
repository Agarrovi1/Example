//
//  CreateProjectViewController.swift
//  project-tracker-post-requests
//
//  Created by Angela Garrovillas on 9/12/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class CreateProjectViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var createButton: UIButton!
    
    //var delegate: AddProjects?
    @IBAction func createButtonPressed(_ sender: UIButton) {
        
        guard let project = createProjectFromFields() else {
            return
        }
        ProjectAPIClient.manager.postProject(project: project) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let success):
                //self.delegate?.addProj(newProj: project)
                self.navigationController?.popViewController(animated: true)
                //we could do something with the data
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    private func createProjectFromFields() -> Project? {
        guard  let name = nameTextField.text else {
            return nil
        }
        return Project(name: name, dueDate: formatAirTableDate(date: datePicker.date))
        
    }
    
    private func formatAirTableDate(date: Date) -> String {
        return date.description.components(separatedBy: .whitespaces)[0]
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
