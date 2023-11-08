//
//  ItemModel.swift
//  ToDoList
//
//  Created by Yogesh Lamba on 05/11/23.
//

import Foundation

struct ItemModel:Identifiable,Codable{
    let id:String
    var title:String
    var isCompleted:Bool
    
    //the id is of type optional string so it is passed when update it and not passed when we want new item
    init(id:String=UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
//    
//    func updateCompletion()->ItemModel{
//        return ItemModel(id:id,title: title, isCompleted: !isCompleted)
//    }
}
