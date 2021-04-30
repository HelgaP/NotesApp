//
//  Model.swift
//  CopyApp
//
//  Created by Irina Perepelkina on 24.04.2021.
//  Copyright © 2021 Irina Perepelkina. All rights reserved.
//

import Foundation
import Alamofire

let server = "192.168.0.12"

struct Note: Decodable {
    var _id: String
    var title: String
    var note: String
    var datee: String
}

class Model {
    
    var delegate: UpdateArray?
    
    static var model = Model()
    
    func fetchNotes() {
        
        AF.request("http://\(server):8081/fetch").responseJSON { (response) in
            
            //dump(response)
            
            guard var fetchedData = response.data else {return}
            
            var decoder = JSONDecoder()
            
            do {
                var notesArray = try decoder.decode([Note].self, from: fetchedData)
                self.delegate?.updateArray(notesArray)
                // Now i need to call update array function here but to execute and return in view controller module
            }
            catch {
                print("Failed to decode")
            }
        }
    }
    
    func createNote (title: String, note: String, date: String) {
        
        AF.request("http://\(server):8081/create", method: .post, headers: ["title": title, "note": note, "datee": date]).responseJSON { (response) in
            
        }
        
    }
    
    func deleteNote (id: String) {
        
        AF.request("http://\(server):8081/delete", method: .post, headers: ["id": id]).responseJSON { (response) in
            
        }
    }
    
    func updateNote (id: String, note: String, title: String, date: String) {
        
        AF.request("http://\(server):8081/update", method: .post, headers: ["title":title, "note": note, "id": id, "datee": date]).responseJSON { (response) in
            
        }
    }
    
}
