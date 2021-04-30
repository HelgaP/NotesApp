//
//  ViewController.swift
//  CopyApp
//
//  Created by Irina Perepelkina on 24.04.2021.
//  Copyright © 2021 Irina Perepelkina. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var notesArray = [Note]()
    
    @IBOutlet weak var notesTableView: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard var vc = segue.destination as? UpdateNoteViewController else {return}
        
        if segue.identifier == "ClickCellSegue" {
            vc.note = notesArray[notesTableView.indexPathForSelectedRow!.row]
            print(notesTableView.indexPathForSelectedRow)
            vc.update = true
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notesTableView.dataSource = self
        notesTableView.delegate = self
        Model.model.delegate = self
        Model.model.fetchNotes()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Model.model.fetchNotes()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Model.model.fetchNotes()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = notesTableView.dequeueReusableCell(withIdentifier: "TheCell") as! noteTableViewCell
        
        cell.title.text = notesArray[indexPath.row].title
        cell.note.text = notesArray[indexPath.row].note
        cell.date.text = notesArray[indexPath.row].datee
   
        return cell
    }
}

extension ViewController: UpdateArray {
    func updateArray(_ array: [Note]) {
        notesArray = array
        notesTableView.reloadData()
    }
}

