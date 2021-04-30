//
//  UpdateNoteViewController.swift
//  CopyApp
//
//  Created by Irina Perepelkina on 25.04.2021.
//  Copyright © 2021 Irina Perepelkina. All rights reserved.
//

import UIKit

class UpdateNoteViewController: UIViewController {
    
    var note: Note?
    var update = false
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextView!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    
    
    @IBAction func saveClick(_ sender: Any) {
        
        if titleTextField.text != "" && bodyTextField.text != "" {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyy-MM-dd"
            let dateString = dateFormatter.string(from: Date())
            
            if update == false  {
                Model.model.createNote(title: titleTextField.text!, note: bodyTextField.text!, date: dateString)
                navigationController?.popViewController(animated: true)
            }
            
            else {
                Model.model.updateNote(id: note!._id, note: bodyTextField.text!, title: titleTextField.text!, date: dateString)
                navigationController?.popViewController(animated: true)
            }
        }
    }
    
    
    @IBAction func deleteClick(_ sender: Any) {
        
        Model.model.deleteNote(id: note!._id)
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if update == true {
            
            guard var note = note else {return}
            titleTextField.text = note.title
            bodyTextField.text = note.note
        }
        else {
            deleteButton.isEnabled = false
            deleteButton.title = ""
        }

    }

}
