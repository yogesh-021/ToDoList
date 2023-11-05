//
//  ListRowViewModel.swift
//  ToDoList
//
//  Created by Yogesh Lamba on 05/11/23.
//

import Foundation

class ListViewModel:ObservableObject{
    @Published var items:[ItemModel]=[]{
        didSet{
            saveItems()
        }
    }
    
    init(){
        getItems()
    }
    
    func getItems(){
        guard
            let data=UserDefaults.standard.data(forKey: "items_key"),
            let savedItems=try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        self.items=savedItems
    }
    
    func deleteItems(indexSet:IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItems(from:IndexSet,to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title:String){
        items.append(ItemModel(title: title, isCompleted: false))
    }
    
    func updateItem(item:ItemModel){
        
//        if let index=items.firstIndex(where: { existingItem in
//            item.id==existingItem.id
//        }){
//             items[index]=item.updateCompletion()
//        }
        
        if let index=items.firstIndex(where: {$0.id==item.id}){
            items[index]=item.updateCompletion()
        }
    }
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: "items_key")
        }
    }
}
